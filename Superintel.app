import { useState } from 'react';

export default function Home() {
const [input, setInput] = useState('');
const [output, setOutput] = useState('');
const [loading, setLoading] = useState(false);
const [history, setHistory] = useState([]);

const sendPrompt = async () => {
if (!input.trim()) return;

setLoading(true);
const promptText = input;
setInput('');

try {
  const res = await fetch('/api/chat', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ prompt: promptText }),
  });
  
  const data = await res.json();
  
  if (res.ok) {
    setOutput(data.response);
    // 채팅 기록에 추가
    setHistory(prev => [
      ...prev, 
      { 
        prompt: promptText, 
        response: data.response,
        timestamp: new Date().toLocaleTimeString()
      }
    ]);
  } else {
    setOutput(`오류 발생: ${data.error || '알 수 없는 오류'}`);
  }
} catch (error) {
  console.error('API 요청 오류:', error);
  setOutput('서버 연결 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
} finally {
  setLoading(false);
}
};

const handleKeyDown = (e) => {
if (e.key === 'Enter' && !e.shiftKey) {
e.preventDefault();
sendPrompt();
}
};

return (




Superintel Chat

GPT-4 + Claude 초지능 인터페이스



  <main className="flex-grow container mx-auto p-4 flex flex-col md:flex-row gap-4">
    <div className="w-full md:w-1/4 bg-white rounded-lg shadow-md p-4 h-full max-h-[80vh] overflow-y-auto">
      <h2 className="font-bold text-lg mb-3 text-gray-700">채팅 기록</h2>
      {history.length === 0 ? (
        <p className="text-gray-500 text-sm">아직 대화 기록이 없습니다. 메시지를 보내보세요.</p>
      ) : (
        <ul className="space-y-2">
          {history.map((item, index) => (
            <li key={index} className="p-2 hover:bg-gray-100 rounded cursor-pointer text-sm">
              <span className="font-medium">{item.timestamp}</span>
              <p className="truncate text-gray-600">{item.prompt}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
    
    <div className="w-full md:w-3/4 flex flex-col">
      <div className="flex-grow bg-white rounded-lg shadow-md p-4 mb-4 overflow-y-auto min-h-[50vh] max-h-[60vh]">
        {output ? (
          <pre className="whitespace-pre-wrap font-sans text-gray-800">{output}</pre>
        ) : (
          <div className="h-full flex items-center justify-center text-gray-400">
            <p>AI 응답이 여기에 표시됩니다</p>
          </div>
        )}
      </div>
      
      <div className="bg-white rounded-lg shadow-md p-4">
        <textarea
          rows={3}
          className="w-full p-3 border border-gray-300 rounded focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="무엇이든 물어보세요..."
          disabled={loading}
        />
        <div className="flex justify-between items-center mt-2">
          <p className="text-xs text-gray-500">Enter 키로 전송, Shift+Enter로 줄바꿈</p>
          <button
            className="px-6 py-2 rounded bg-blue-600 hover:bg-blue-700 text-white font-medium transition-colors disabled:opacity-50"
            onClick={sendPrompt}
            disabled={loading || !input.trim()}
          >
            {loading ? '처리중...' : '전송'}
          </button>
        </div>
      </div>
    </div>
  </main>
  
  <footer className="bg-gray-800 text-white text-center p-3 text-sm">
    <p>Superintel App - Powered by OpenAI GPT-4 and Anthropic Claude</p>
  </footer>
</div>
);
}import { useState } from 'react';

export default function Home() {
const [input, setInput] = useState('');
const [output, setOutput] = useState('');
const [loading, setLoading] = useState(false);
const [history, setHistory] = useState([]);

const sendPrompt = async () => {
if (!input.trim()) return;

setLoading(true);
const promptText = input;
setInput('');

try {
  const res = await fetch('/api/chat', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ prompt: promptText }),
  });
  
  const data = await res.json();
  
  if (res.ok) {
    setOutput(data.response);
    // 채팅 기록에 추가
    setHistory(prev => [
      ...prev, 
      { 
        prompt: promptText, 
        response: data.response,
        timestamp: new Date().toLocaleTimeString()
      }
    ]);
  } else {
    setOutput(`오류 발생: ${data.error || '알 수 없는 오류'}`);
  }
} catch (error) {
  console.error('API 요청 오류:', error);
  setOutput('서버 연결 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
} finally {
  setLoading(false);
}
};

const handleKeyDown = (e) => {
if (e.key === 'Enter' && !e.shiftKey) {
e.preventDefault();
sendPrompt();
}
};

return (




Superintel Chat

GPT-4 + Claude 초지능 인터페이스



  <main className="flex-grow container mx-auto p-4 flex flex-col md:flex-row gap-4">
    <div className="w-full md:w-1/4 bg-white rounded-lg shadow-md p-4 h-full max-h-[80vh] overflow-y-auto">
      <h2 className="font-bold text-lg mb-3 text-gray-700">채팅 기록</h2>
      {history.length === 0 ? (
        <p className="text-gray-500 text-sm">아직 대화 기록이 없습니다. 메시지를 보내보세요.</p>
      ) : (
        <ul className="space-y-2">
          {history.map((item, index) => (
            <li key={index} className="p-2 hover:bg-gray-100 rounded cursor-pointer text-sm">
              <span className="font-medium">{item.timestamp}</span>
              <p className="truncate text-gray-600">{item.prompt}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
    
    <div className="w-full md:w-3/4 flex flex-col">
      <div className="flex-grow bg-white rounded-lg shadow-md p-4 mb-4 overflow-y-auto min-h-[50vh] max-h-[60vh]">
        {output ? (
          <pre className="whitespace-pre-wrap font-sans text-gray-800">{output}</pre>
        ) : (
          <div className="h-full flex items-center justify-center text-gray-400">
            <p>AI 응답이 여기에 표시됩니다</p>
          </div>
        )}
      </div>
      
      <div className="bg-white rounded-lg shadow-md p-4">
        <textarea
          rows={3}
          className="w-full p-3 border border-gray-300 rounded focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="무엇이든 물어보세요..."
          disabled={loading}
        />
        <div className="flex justify-between items-center mt-2">
          <p className="text-xs text-gray-500">Enter 키로 전송, Shift+Enter로 줄바꿈</p>
          <button
            className="px-6 py-2 rounded bg-blue-600 hover:bg-blue-700 text-white font-medium transition-colors disabled:opacity-50"
            onClick={sendPrompt}
            disabled={loading || !input.trim()}
          >
            {loading ? '처리중...' : '전송'}
          </button>
        </div>
      </div>
    </div>
  </main>
  
  <footer className="bg-gray-800 text-white text-center p-3 text-sm">
    <p>Superintel App - Powered by OpenAI GPT-4 and Anthropic Claude</p>
  </footer>
</div>
);
}
import axios from 'axios';

export async function queryClaude(prompt) {
// 최신 Claude API 엔드포인트 사용
const response = await axios.post(
'https://api.anthropic.com/v1/messages',
{
model: 'claude-3-opus-20240229', // 최신 모델 사용
max_tokens: 1000,
messages: [
{ role: 'user', content: prompt }
]
},
{
headers: {
'x-api-key': process.env.CLAUDE_API_KEY,
'anthropic-version': '2023-06-01',
'Content-Type': 'application/json',
},
}
);

// 새로운 응답 형식에 맞게 데이터 추출
return response.data.content[0].text;
}
{
"name": "superintel-app",
"version": "1.0.0",
"scripts": {
"dev": "next dev",
"build": "next build",
"start": "next start"
},
"dependencies": {
"next": "latest",
"react": "latest",
"react-dom": "latest",
"openai": "^4.0.0",
"axios": "^1.0.0",
"tailwindcss": "^3.3.0",
"postcss": "^8.4.21",
"autoprefixer": "^10.4.14"
}
}
module.exports = {
plugins: {
tailwindcss: {},
autoprefixer: {},
},
}
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
html {
font-family: 'Inter', system-ui, sans-serif;
}

body {
@apply bg-gray-50;
}

h1, h2, h3, h4, h5, h6 {
@apply font-medium;
}
}

@layer components {
.btn {
@apply px-4 py-2 rounded font-medium transition-colors;
}

.btn-primary {
@apply bg-blue-600 text-white hover:bg-blue-700;
}

.card {
@apply bg-white rounded-lg shadow-md p-4;
}

.input {
@apply w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-blue-500 focus:border-transparent;
}
}

/* 스크롤바 스타일링 */
::-webkit-scrollbar {
width: 8px;
height: 8px;
}

::-webkit-scrollbar-track {
@apply bg-gray-100 rounded;
}

::-webkit-scrollbar-thumb {
@apply bg-gray-400 rounded hover:bg-gray-500;
}

/* AI 응답 스타일링 */
.ai-response {
@apply p-4 rounded-lg my-2;
}

.openai-response {
@apply bg-green-50 border-l-4 border-green-500;
}

.claude-response {
@apply bg-purple-50 border-l-4 border-purple-500;
}
/** @type {import('tailwindcss').Config} /
module.exports = {
content: [
"./pages/**/.{js,ts,jsx,tsx}",
"./components/**/*.{js,ts,jsx,tsx}",
],
theme: {
extend: {
colors: {
// 아래는 Superintel 앱을 위한 커스텀 색상입니다
primary: {
50: '#eef2ff',
100: '#e0e7ff',
200: '#c7d2fe',
300: '#a5b4fc',
400: '#818cf8',
500: '#6366f1', // 기본 primary 색상
600: '#4f46e5',
700: '#4338ca',
800: '#3730a3',
900: '#312e81',
},
secondary: {
50: '#f5f3ff',
100: '#ede9fe',
200: '#ddd6fe',
300: '#c4b5fd',
400: '#a78bfa',
500: '#8b5cf6', // 기본 secondary 색상
600: '#7c3aed',
700: '#6d28d9',
800: '#5b21b6',
900: '#4c1d95',
},
},
fontFamily: {
sans: ['Inter', 'ui-sans-serif', 'system-ui', '-apple-system', 'sans-serif'],
},
boxShadow: {
'soft': '0 2px 15px -3px rgba(0, 0, 0, 0.07), 0 10px 20px -2px rgba(0, 0, 0, 0.04)',
},
},
},
plugins: [],
}
import { useState } from 'react';

const SuperintelHomepage = () => {
const [input, setInput] = useState('');
const [output, setOutput] = useState('');
const [loading, setLoading] = useState(false);
const [history, setHistory] = useState([]);

const sendPrompt = async () => {
if (!input.trim()) return;

setLoading(true);

// Save current prompt to history
const newPrompt = { 
  prompt: input, 
  timestamp: new Date().toLocaleTimeString() 
};

try {
  // This would be a real API call in a deployed app
  // const res = await fetch('/api/chat', {
  //   method: 'POST',
  //   headers: { 'Content-Type': 'application/json' },
  //   body: JSON.stringify({ prompt: input }),
  // });
  // const data = await res.json();
  
  // Simulation for demo purposes only
  await new Promise(resolve => setTimeout(resolve, 1500));
  
  // Example response simulation
  const simulatedResponse = `OpenAI says:
This is a simulated response from GPT-4. I would analyze your prompt "${input}" and provide a thoughtful answer based on my training data.

Claude says:
Hi there! This is a simulated Claude response. If this were real, I'd carefully consider your question about "${input}" and offer my perspective.`;

  setOutput(simulatedResponse);
  setHistory(prev => [...prev, { ...newPrompt, response: simulatedResponse }]);
  setInput('');
} catch (error) {
  setOutput('Error: Could not connect to AI services.');
} finally {
  setLoading(false);
}
};

const handleKeyDown = (e) => {
if (e.key === 'Enter' && !e.shiftKey) {
e.preventDefault();
sendPrompt();
}
};

return (




Superintel Chat

GPT-4 + Claude combined intelligence



  <main className="flex-grow container mx-auto p-4 flex flex-col md:flex-row gap-4">
    <div className="w-full md:w-1/4 bg-white rounded-lg shadow-md p-4 h-full overflow-y-auto">
      <h2 className="font-bold text-lg mb-3 text-gray-700">Chat History</h2>
      {history.length === 0 ? (
        <p className="text-gray-500 text-sm">No history yet. Start by sending a message.</p>
      ) : (
        <ul className="space-y-2">
          {history.map((item, index) => (
            <li key={index} className="p-2 hover:bg-gray-100 rounded cursor-pointer text-sm">
              <span className="font-medium">{item.timestamp}</span>
              <p className="truncate text-gray-600">{item.prompt}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
    
    <div className="w-full md:w-3/4 flex flex-col">
      <div className="flex-grow bg-white rounded-lg shadow-md p-4 mb-4 overflow-y-auto min-h-96">
        {output ? (
          <pre className="whitespace-pre-wrap font-sans text-gray-800">{output}</pre>
        ) : (
          <div className="h-full flex items-center justify-center text-gray-400">
            <p>AI responses will appear here</p>
          </div>
        )}
      </div>
      
      <div className="bg-white rounded-lg shadow-md p-4">
        <textarea
          rows={3}
          className="w-full p-3 border border-gray-300 rounded focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="Ask anything..."
          disabled={loading}
        />
        <div className="flex justify-between items-center mt-2">
          <p className="text-xs text-gray-500">Press Enter to send, Shift+Enter for new line</p>
          <button
            className="px-6 py-2 rounded bg-blue-600 hover:bg-blue-700 text-white font-medium transition-colors disabled:opacity-50"
            onClick={sendPrompt}
            disabled={loading || !input.trim()}
          >
            {loading ? 'Processing...' : 'Send'}
          </button>
        </div>
      </div>
    </div>
  </main>
  
  <footer className="bg-gray-800 text-white text-center p-3 text-sm">
    <p>Superintel App - Powered by OpenAI GPT-4 and Anthropic Claude</p>
  </footer>
</div>
);
};

export default SuperintelHomepage;

You can view, comment on, or merge this pull request online at:
  https://github.com/Gimyeoungmin/KOKI-GET.COM/pull/1

Commit Summary
8617157 Create react
File Changes (1 file)
A react (520)
Patch Links:
https://github.com/Gimyeoungmin/KOKI-GET.COM/pull/1.patch
https://github.com/Gimyeoungmin/KOKI-GET.COM/pull/1.diff
—
Reply to this email directly, view it on GitHub, or unsubscribe.
You are receiving this because you are subscribed to this thread.

