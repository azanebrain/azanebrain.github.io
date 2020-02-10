---
layout: post
title: "Spy On Redux Actions by Type"
date: 2020-02-09
categories: "angular"
tags: ["angular", "angular-tips", "redux"]
---

When testing Angular components that use Redux, it's really important to make sure that correct actions are being dispatched with proper payloads.

One easy solution is to spy on the store's dispatch method and evaluate the specific action in the calls list. However, what if your component dispatches another action? What if you have some extra logic which changes which actions are called? On top of that, saying "what was the payload on action number 5?" isn't semantic and makes it hard for your teammates to read your code and contribute to the test.

Instead, you can filter the list of dispatched actions by type. This way, you make it incredibly clear _which_ action the test cares about, you always get the correct action no matter how your component logic changes, and you get to rely strongly-typed syntax.

Here's a short snippet of how you can use this alproach:

```
describe('MyTestableComponent', () => {
  let component: MyTestableComponent
  let fixture: ComponentFixture<MyTestableComponent>
  // Expose the Store's dispatch spy to be used in assertions
  let store: Store<AppState>
  let storeDispatchSpy: jasmine.Spy

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [MyTestableModule]
    })
      .compileComponents()
  }))

  beforeEach(() => {
    fixture = TestBed.createComponent(MyTestableComponent)
    component = fixture.componentInstance
    // Define the dispatch spy
    store = TestBed.get(Store)
    storeDispatchSpy = spyOn(store, 'dispatch').and.callThrough()
  })

  it(`should emit my action when something is triggered`, fakeAsync(() => {
    const expectedPayload = { foo: 'bar' }
    // Select the action we want by filtering by its type
    const expectedAction = storeDispatchSpy.calls.allArgs()
      .filter((call: Action[]) => call[0].type === myActions.SOME_ACTION)

    // Trigger whatever logic that will emit the action
    component.triggerSomething()

    expect(expectedAction[0][0].payload).toEqual(expectedPayload)
  }))
})
```
