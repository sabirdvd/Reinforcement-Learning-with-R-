# our Problem
# Learning an agent traveling through a 2x2 grid (4states)
#         ------  ----
#        |  S0  %   S3 | S3 is our goal 
#        |------|------|
#        |  S1  |  S2  |
#         -------------    
# Wall % prevents direct moves from S0 to S3
# Reward favor shorter routes  
# 1- Visiting each square/satae given a reward of -1
# Reaching the goal given a reward of 10
# Action: move left, rightm up or down 
#Transition probabilites are < 1
#--------------------------------------------------
# with Q-learning 

library (MDPtoolbox)

actions <-c("up", "left", "down", "right")
states <-c ("s0", "s1", "s2", "s3")

simulateEnvironment <-function (state, action) {  ...
}

#Add a Q-learning function that performs a given number n of episodes
Qlearning <-function (n, s_0, s_terminal, epsilon, learning_rate) {...
}

#Call Q-learning with an initial state s_0 , a final state s_terminal
#and desired parameters to search a polic

simulateEnvironment <-function(state, action) {
  # Calculate next state (according to sample grid with wall)
  # Default: remain in a state if action tries to leave grid
  next_state <- state
  if (state == "s0" && action == "down")  next_state <- "s1"
  if (state == "s1" && action == "up")    next_state <- "s0"
  if (state == "s1" && action == "right") next_state <- "s2"
  if (state == "s2" && action == "left")  next_state <- "s1"
  if (state == "s2" && action == "up")    next_state <- "s3"
  if (state == "s3" && action == "down")  next_state <- "s2"
  # Calculate reward
  if (next_state == "s3") {
    reward <- 10
  }else{
    reward <- -1}
return(list(state=next_state, reward=reward))
  
Qlearning <-function (n, s_0, s_terminal, epsilon, learning_rate) {
# Initialize state-action function Q to zero
Q <-matrix(0, nrow=length(states), ncol=length(actions),
               dimnames=list(states, actions))
# Perform n episodes/iterations of Q-learning
    for(i in 1:n) {
      Q <-learnEpisode(s_0, s_terminal,
                       epsilon, learning_rate, Q)
    }
return(Q)
  }
  
  

#learning parameters
epsilon <- 0.1
learning_rate <- 0.1

#Calculate state-action function Q after 1000 episodes
set.seed (0)
Q <-Qlearning(1000, "s0", "s3", epsilon, learning_rate)

#Optimal poliactions
actions[max.col(Q)]
