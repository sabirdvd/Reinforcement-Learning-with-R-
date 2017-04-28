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
# we are using MDP to finds the optimal policy for this problem

# install this toolbox from pacakages ------------------------------------------------------->
library (MDPtoolbox)
# matrices with pre-specified (random) transition probabilities for each action
up <- matrix (c (1,   0,   0,    0,
                 0.7, 0.2, 0.1,  0,
                 0, 0.1, 0.2, 0.7,
                 0,   0,   0,   1),
            nrow=4, ncol=4, byrow=TRUE)

left <- matrix (c (0.9,   0.1,   0,   0,
                   0.1,   0.9,   0,   0,
                   0,    0.7,  0.2,  0.1,
                   0,    0,    0.1,  0.9),
              nrow=4, ncol=4, byrow=TRUE)

down <- matrix(c(0.3, 0.7,0,    0,
                 0, 0.9, 0.1,   0,
                 0, 0.1, 0.9,   0,
                 0,   0, 0.7, 0.3),
             nrow=4, ncol=4, byrow=TRUE)


right <-matrix(c(0.9, 0.1,   0,   0,
                 0.1, 0.2, 0.7,   0,
                 0,   0, 0.9, 0.1,
                 0,   0, 0.1, 0.9),
            nrow=4, ncol=4, byrow=TRUE)

#create transition probabilities in T
T <- list(up=up, left=left, down=down, right=right)


#Create matrix with rewards
R <-matrix(c(-1, -1, -1, -1,
             -1, -1, -1, -1,
             -1, -1, -1, -1,
             10, 10, 10, 10),
           nrow=4, ncol=4, byrow=TRUE)
# check, it should be empty 
mdp_check(T, R)


#Policy iteration with discount factor alpah = 0.9
m <-mdp_policy_iteration (P=T, R=R, discount=0.9)
#optimal policy 
m$policy
#show the names
names(T)[m$policy]
#Display value function 
m$V
