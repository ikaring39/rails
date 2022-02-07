// 変数を定義
let text = "Hello World";
// アラートで表示される
//alert(text);

// document.write("<p>" + text + "</p>");
// デバッグのコンソールに表示される
text += " hey"
console.log(text);

// TODOリスト作成する
const form = document.getElementById("form");
const input = document.getElementById("input");
const ul = document.getElementById("ul");

const todos = JSON.parse(localStorage.getItem("todos"));
if(todos){
  console.log('true');
}else{
    console.log('false');
}


if(todos > 0){
    todos.forEach(todo => {
        add(todo);
    })
}
form.addEventListener("submit", function (event){
    // デフォルトのイベントを発生させない
    event.preventDefault();
    console.log(input.value);
    add(todos);
});

// リストを追加する
function add(todo){
    // 空文字を禁止
    let todoText = input.value;

    if(todo > 0){
        todoText = todo.text;
    }

    if(todoText.length > 0){
        const li = document.createElement("li");
        li.innerText = todoText;
        li.classList.add("list-group-item");

        if(todo > 0 && todo.completed){
            li.classList.add("text-decoration-line-through");

        }
        // 右クリックで削除する
        li.addEventListener("contextmenu", function(event){
            event.preventDefault();
            li.remove();
            saveData();
        });
        // クリックで打消し線を追加
        li.addEventListener("click", function(){
            li.classList.toggle("text-decoration-line-through");
            saveData();
        });

        ul.appendChild(li);
        input.value = "";
        saveData();
    }
}

// ブラウザにデータを保存する
function saveData(){
    const lists = document.getElementsByClassName("list-group-item");
//    const lists = document.querySelectorAll(".list-group-item");
    let todos = [];
    Array.from(lists).forEach(list => {
        let todo = {
            text: list.innerText,
            completed: list.classList.contains("text-decoration-line-through")
        }
        todos.push(todo);
    });
    localStorage.setItem("todos", JSON.stringify(todos));
}