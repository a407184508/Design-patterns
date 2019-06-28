# Design-patterns

# Swift 中的设计模式的使用

### tip: 在创建文件夹的时候每次都是从上面创建的，记得从下往上看，嘻嘻

```Swift 
 // 1. factory
        
        let createCar = FactoryCar().getCar(.Mercedes)
        createCar.createCar()
        
        
        // 2. abstract factory
        
        let factory = FactoryProducer().getFactory(.shape)
        let factoryShape = factory.getShape(.Circle)
        factoryShape?.draw()
        
        // 3. factory func
        
        let str = getFoctoryClass("Test Class Name")
        print(str)
        
        // 4. singleton
        
        let instance = Instances.instance
        print(instance.name)
        
        // 5. Builder
        
        let meal = MealBuilder().prepareVegMeal()
        print(meal.getCost())
        meal.showItems()
        
        // 6. adapter
    
        let audioPlayer = AudioPlayer()
        audioPlayer.player(audioType: "mp4", withFileName: "filename")
        audioPlayer.player(audioType: "mp3", withFileName: "filename")
        
        // 7. Bridge
        
        let pig = EightQuit(soul: "eight", body: "quit")
        pig.generatePerson(Soul())
        
        // 8. filter
        
        let person1 = Person(name: "Jack", gender: "male", maritalStatus: "single")
        let person2 = Person(name: "Lina", gender: "female", maritalStatus: "not")
        let person3 = Person(name: "Chuck", gender: "female", maritalStatus: "single")
        
        let criteria = OrCriteria(criteria: CriteriaMale(), other: CriteriaSingle())
        let persons = criteria.meetCriteria(persons: [person1, person2, person3])
        print(persons.map { $0.name })
        
        // 9. composite
        
        let composite1 = Employee(name: "Jack", dept: "CEO", salary: 30000)
        let composite2 = Employee(name: "Lina", dept: "Marketing", salary: 20000)
        let composite3 = Employee(name: "Chuck", dept: "Sales", salary: 10000)
        
        composite1.add(composite2)
        composite1.add(composite3)
        
        for e in composite1.subordinates {
            print(e.description)
        }
        
        
        // 10. decorator
        
        let decorator = TempleDecorator(decorator: Temple())
        decorator.skills()
        
        // 11. Facade Pattern
        
        let doctor = DoctorMaker()
        doctor.registeredEvent()
        doctor.outpatientServiceEvent()
        
        // 12. flyweight
        
        let shapeFlyweightFactory = ShapeFlyweightFactory()
        shapeFlyweightFactory.getCircle(color: "red color").draw()
        
        // 13. proxy
        
        let proxy = ProxyPattern()
        proxy.delegate = self
        proxy.proxy()
        
        // 14. Chain of Responsibility Pattern
        
        let errorLogger = ErrorLogger(level: .error)
        let fileLogger = FileLogger(level: .debug)
        let consoleLogger = ConsoleLogger(level: .info)
        
        errorLogger.nextLogger = fileLogger
        fileLogger.nextLogger = consoleLogger
        
        errorLogger.logMessage(level: .info, withMessage: "log info")
        errorLogger.logMessage(level: .debug, withMessage: "log debug")
        errorLogger.logMessage(level: .error, withMessage: "log error")
        
        
        // 15. command pattern
        let abcStock = Stock()
        let buyStock = BuyStock(stock: abcStock)
        let sellStock = SellStock(stock: abcStock)
        
        let broker = Broker()
        broker.takeOrder(buyStock)
        broker.takeOrder(sellStock)

        broker.placeOrders()
        
        // 16. interpreter
        
        let expr1 = TerminalExpression("robert")
        let expr2 = TerminalExpression("john")
        
        let orExpr = OrExpression(expr1: expr1, expr2: expr2)
        
        let andExpr = AndExpression(expr1: expr1, expr2: expr2)
        
        print(orExpr.interpreter("john"))
        print(andExpr.interpreter("john"))
        
        // 17. iterator
        
        let nameRepository = NameRepository()
        
        let iter = nameRepository.getInerator()
        
        while iter.hasNext() {
            print(iter.next() as! String)
        }
        
        // 18. mediator
        
        let user1 = User(name: "Jack")
        let user2 = User(name: "Chuck")
        
        user1.sendMessage("Hi chuck, I'm Jack")
        user2.sendMessage("Hello, How are you?")
        
        
        // 19. memento
        
        let originator = Originator()
        let careTaker = CareTaker()
        
        originator.state = "State #1"
        originator.state = "State #2"
        careTaker.add(state: originator.saveStateToMemento())
        
        originator.state = "State #3"
        careTaker.add(state: originator.saveStateToMemento())
        
        originator.state = "State #4"
        careTaker.add(state: originator.saveStateToMemento())
        
        print(originator.state) // State #4
        originator.getStateFormMemento(memento: careTaker.get(index: 0))
        print(originator.state) // State #2
        originator.getStateFormMemento(memento: careTaker.get(index: 1))
        print(originator.state) // State #3
        
        
        // 20. Observer
        
        let subject = Subject()
        _ = HexaObserver(subject: subject)
        _ = OctalObserver(subject: subject)
        _ = BinaryObserver(subject: subject)
        
        print("first state change: 15")
        subject.state = 15
        print("second state change: 10")
        subject.state = 10
        
        // 21. state
        
        let context = Context()
        
        let startState = StartState()
        startState.doAction(context)
        print(startState.description)
        let stopState = StopState()
        stopState.doAction(context)
        print(stopState.description)
        
        // 22. null object
        
        let customer1 = CustomerFactory.getCustomer(name: "Rob")
        let customer2 = CustomerFactory.getCustomer(name: "Jack")
        print(customer1.name!)
        print(customer2.name!)
        
        // 23. Strategy
        
        let contextStrategy1 = ContextStrategy(strategy: OperationAdd())
        print(contextStrategy1.executeStrategy(num1: 10, num2: 5))
        
        let contextStrategy2 = ContextStrategy(strategy: OperationSubstract())
        print(contextStrategy2.executeStrategy(num1: 10, num2: 5))
        
        let contextStrategy3 = ContextStrategy(strategy: OperationMultiply())
        print(contextStrategy3.executeStrategy(num1: 10, num2: 5))
        
        // 24. template
        
        var game: Game = Cricket()
        game.play()
        
        game = Football()
        game.play()
        
        
        // 25. visitor
        
        let computer = Computer()
        computer.accept(ComputerPartDisplayVisitor())
        
        // 26. mvc
        
        let model = Student(name: "Jack", rollNo: "0001")
        let view = StudentView()
        let controller = StudentController(model: model, view: view)
        
        controller.updateView()
        
        controller.studentName = "Rob"
        controller.updateView()
        
        // 27. Business
        
        let businessDelegate = BusinessDelegate()
        businessDelegate.serviceType = "EJB"
        
        let client = Client(service: businessDelegate)
        client.doTask()
        
        businessDelegate.serviceType = "JMS"
        client.doTask()
        
        // 28. composite entity pattern
        
        let clientEntity = ClientEntity()
        clientEntity.setData(data1: "test", data2: "data")
        clientEntity.printData()
        
        clientEntity.setData(data1: "second test", data2: "data")
        clientEntity.printData()
        
        // 29. Data Access Object
        
        let dao: StudentDao = StudentDaoImp()
        
        for stu in dao.getAllStudents() {
            print("\(stu.name!)")
        }
        // updaate | get | remove | add
        
        // 30. front controller
        
        let frontController = FrontController()
        frontController.dispatchRequest(request: "my")
        frontController.dispatchRequest(request: "home")
        
        // 31. intercepting filter
        
        let filterManager = FilterManager(target: Target())
        filterManager.setFilter(filter: AuthenticationFilter())
        filterManager.setFilter(filter: DebugFilter())
        
        let ifClient = InterceptingFilterClient()
        ifClient.setFilterManager(filter: filterManager)
        ifClient.sendRequest(request: "home")
        
        // 32. service  locator
        
        var service = ServiceLocator().getService(name: "Service 1")
        service.exeute()
        service = ServiceLocator().getService(name: "Service 2")
        service.exeute()
        service = ServiceLocator().getService(name: "Service 1")
        service.exeute()
        
        // 33. Transfer Object Pattern
        
        let bo = StudentBO()
        
        let stu = bo.getStudent(number: 0)
        print(stu.name)
```
