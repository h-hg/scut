/*
Copyright IBM Corp. 2016 All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

		 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package main

//WARNING - this chaincode's ID is hard-coded in chaincode_example04 to illustrate one way of
//calling chaincode from a chaincode. If this example is modified, chaincode_example04.go has
//to be modified as well with the new ID of chaincode_example02.
//chaincode_example05 show's how chaincode ID can be passed in as a parameter instead of
//hard-coding.

/*
by h-hg
主要内容：
	定义了一个类型为SimpChaincode的struct，并为它实现了Init, Invoke, invoke, delete, query的方法
Golang 语法
	1.struct中的方法的实现:func (struct_name_variable struct_name) method_namen() [return_type] {}
	2._的用处：(1)在接受返回值表示忽略这个返回值
	3. nil 类似C++ nullptr
一些官方文档的函数调用解释：
	shim.ChaincodeStubInterface： https://github.com/hyperledger/fabric/blob/release-1.4/core/chaincode/shim/interfaces.go
	1. PutState(key string, value []byte) error
		// PutState puts the specified `key` and `value` into the transaction's
		// writeset as a data-write proposal. PutState doesn't effect the ledger
		// until the transaction is validated and successfully committed.
		// Simple keys must not be an empty string and must not start with null
		// character (0x00), in order to avoid range query collisions with
		// composite keys, which internally get prefixed with 0x00 as composite
		// key namespace.
	2. GetFunctionAndParameters() (string, []string)
		// GetFunctionAndParameters returns the first argument as the function
		// name and the rest of the arguments as parameters in a string array.
		// Only use GetFunctionAndParameters if the client passes arguments intended
		// to be used as strings.
	3.GetState(key string) ([]byte, error)
		// GetState returns the value of the specified `key` from the
		// ledger. Note that GetState doesn't read data from the writeset, which
		// has not been committed to the ledger. In other words, GetState doesn't
		// consider data modified by PutState that has not been committed.
		// If the key does not exist in the state database, (nil, nil) is returned.

*/
import (
	"fmt"//标准的输出输入
	"strconv"//实现基本的数据类型与string类型的转换

	"github.com/hyperledger/fabric/core/chaincode/shim"
	pb "github.com/hyperledger/fabric/protos/peer"
)
//Chaincode定义：Chaincode是一段由Go语言编写（支持其他编程语言，如Java），并能实现预定义接口的程序。Chaincode运行在一个受保护的Docker容器当中，与背书节点的运行互相隔离。Chaincode可通过应用提交的交易对账本状态初始化并进行管理。
// SimpleChaincode example simple Chaincode implementation
/*
每一个基于fabric的区块链都需要定义这个结构体
SimpleChaincode的个函数
	Init
	Invoke 调用了 invoke， delete， query
*/
type SimpleChaincode struct {
}

/*
参数 stub shim.ChaincodeStubInterface提供业务逻辑的方法
*/
func (t *SimpleChaincode) Init(stub shim.ChaincodeStubInterface) pb.Response {
	fmt.Println("ex02 Init")
	/*
	GetFunctionAndParameters()函数返回两部分第一部分是函数，第二部分是参数
	_变量代表方法名，args是接受的参数
	*/
	_, args := stub.GetFunctionAndParameters()
	var AC, CA,EA,NA,SA,SHA,SIA,WA,XA string    // 9 Entities
	var ACval, CAval,EAval,NAval,SAval,SHAval,SIAval,WAval,XAval int // 9 Asset holdings
	var err error

	//if len(args) != 18 {
	//	return shim.Error("Incorrect number of arguments. Expecting 4")
	//}

	// Initialize the chaincode
	AC = args[0]
	ACval, err = strconv.Atoi(args[1])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	CA = args[2]
	CAval, err = strconv.Atoi(args[3])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	EA = args[4]
	EAval, err = strconv.Atoi(args[5])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	NA = args[6]
	NAval, err = strconv.Atoi(args[7])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	SA = args[8]
	SAval, err = strconv.Atoi(args[9])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	SHA = args[10]
	SHAval, err = strconv.Atoi(args[11])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	SIA = args[12]
	SIAval, err = strconv.Atoi(args[13])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	WA = args[14]
	WAval, err = strconv.Atoi(args[15])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}
	XA = args[16]
	XAval, err = strconv.Atoi(args[17])
	if err != nil {
		return shim.Error("Expecting integer value for asset holding")
	}


	fmt.Printf("ACval = %d, CAval = %d\n", ACval, CAval)

	// Write the state to the ledger
	err = stub.PutState(AC, []byte(strconv.Itoa(ACval)))
	if err != nil {
		return shim.Error(err.Error())
	}

	err = stub.PutState(CA, []byte(strconv.Itoa(CAval)))
	if err != nil {
		return shim.Error(err.Error())
	}

	err = stub.PutState(EA, []byte(strconv.Itoa(EAval)))
	if err != nil {
		return shim.Error(err.Error())
	}
	err = stub.PutState(NA, []byte(strconv.Itoa(NAval)))
	if err != nil {
		return shim.Error(err.Error())
	}
	err = stub.PutState(SA, []byte(strconv.Itoa(SAval)))
	if err != nil {
		return shim.Error(err.Error())
	}
	err = stub.PutState(SHA, []byte(strconv.Itoa(SHAval)))
	if err != nil {
		return shim.Error(err.Error())
	}
	err = stub.PutState(SIA, []byte(strconv.Itoa(SIAval)))
	if err != nil {
		return shim.Error(err.Error())
	}
	err = stub.PutState(WA, []byte(strconv.Itoa(WAval)))
	if err != nil {
		return shim.Error(err.Error())
	}
	err = stub.PutState(XA, []byte(strconv.Itoa(XAval)))
	if err != nil {
		return shim.Error(err.Error())
	}

	return shim.Success(nil)
}

func (t *SimpleChaincode) Invoke(stub shim.ChaincodeStubInterface) pb.Response {
	fmt.Println("ex02 Invoke")
	function, args := stub.GetFunctionAndParameters()
	/*
	调用自定义的函数部分
	*/
	if function == "invoke" {
		// Make payment of X units from A to B
		return t.invoke(stub, args)
	} else if function == "delete" {
		// Deletes an entity from its state
		return t.delete(stub, args)
	} else if function == "query" {
		// the old "Query" is now implemtned in invoke
		return t.query(stub, args)
	}

	return shim.Error("Invalid invoke function name. Expecting \"invoke\" \"delete\" \"query\"")
}

/*
	这个函数应该是实现了积分转换并且写入了账本
	一下的函数都有这些：
	GetState
	PutState
	DelState
	初步理解是对数据的获取，添加和删除
*/
// Transaction makes payment of X units from A to B
func (t *SimpleChaincode) invoke(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	var A, B string    // Entities
	var Aval, Bval int // Asset holdings
	var X, Y int          // Transaction value
	var err error

	if len(args) != 4 {
		return shim.Error("Incorrect number of arguments. Expecting 4")
	}

	A = args[0]
	B = args[1]

	// Get the state from the ledger
	// TODO: will be nice to have a GetAllState call to ledger
	Avalbytes, err := stub.GetState(A)
	if err != nil {
		return shim.Error("Failed to get state")
	}
	if Avalbytes == nil {
		return shim.Error("Entity not found")
	}
	Aval, _ = strconv.Atoi(string(Avalbytes))

	Bvalbytes, err := stub.GetState(B)
	if err != nil {
		return shim.Error("Failed to get state")
	}
	if Bvalbytes == nil {
		return shim.Error("Entity not found")
	}
	Bval, _ = strconv.Atoi(string(Bvalbytes))

	// Perform the execution
	X, err = strconv.Atoi(args[2])
	if err != nil {
		return shim.Error("Invalid transaction amount, expecting a integer value")
	}
	Y, err = strconv.Atoi(args[3])
	if err != nil {
		return shim.Error("Invalid transaction amount, expecting a integer value")
	}

	Aval = Aval - X
	Bval = Bval + Y
	fmt.Printf("%s = %d, %s = %d\n", A ,Aval,B, Bval)

	// Write the state back to the ledger
	err = stub.PutState(A, []byte(strconv.Itoa(Aval)))
	if err != nil {
		return shim.Error(err.Error())
	}

	err = stub.PutState(B, []byte(strconv.Itoa(Bval)))
	if err != nil {
		return shim.Error(err.Error())
	}

	return shim.Success(nil)
}

// Deletes an entity from state
func (t *SimpleChaincode) delete(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	if len(args) != 1 {
		return shim.Error("Incorrect number of arguments. Expecting 1")
	}

	A := args[0]

	// Delete the key from the state in ledger
	err := stub.DelState(A)
	if err != nil {
		return shim.Error("Failed to delete state")
	}

	return shim.Success(nil)
}

// query callback representing the query of a chaincode
func (t *SimpleChaincode) query(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	var A string // Entities
	var err error

	if len(args) != 1 {
		return shim.Error("Incorrect number of arguments. Expecting name of the person to query")
	}

	A = args[0]

	// Get the state from the ledger
	Avalbytes, err := stub.GetState(A)
	if err != nil {
		jsonResp := "{\"Error\":\"Failed to get state for " + A + "\"}"//使用了自动推到，类型为string
		return shim.Error(jsonResp)
	}

	if Avalbytes == nil {
		jsonResp := "{\"Error\":\"Nil amount for " + A + "\"}"
		return shim.Error(jsonResp)
	}

	jsonResp := "{\"Name\":\"" + A + "\",\"Amount\":\"" + string(Avalbytes) + "\"}"
	fmt.Printf("Query Response:%s\n", jsonResp)
	return shim.Success(Avalbytes)
}

//用以启动区块链
func main() {
	err := shim.Start(new(SimpleChaincode))
	if err != nil {
		fmt.Printf("Error starting Simple chaincode: %s", err)
	}
}
