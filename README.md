# Hardware-based-locking-system

The code aims to take any 8 bit binary number and detect it in the incoming input stream. For this, we have followed non-overlapping Moore finite state machine logic.
The module takes in the clock signal, reset signal, input stream x_in (bit by bit) and the sequence seq to be detected through parameters to process and generate the output signal which will signify whether the sequence has been detected or not.
The model has 8+1 states S0 to S8, and undergoes state transition and gives output generation at positive clock edge or at negative edge of asynchronous reset.

Link to EDAPlayground: https://www.edaplayground.com/x/My2A

Link to Canva presentation: [Canva](https://www.canva.com/design/DAE8ecK1c24/cHBexhS2T6089V9dYU50tg/edit?utm_content=DAE8ecK1c24&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

-- This project was built in collaboration with another team member.
