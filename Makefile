# Defines
CC         = gcc
OBJ_DIR    = ./src
SRC_DIR    = ./src
INCL_DIR   = ./include
OBJECTS    = $(addprefix $(OBJ_DIR)/, read_csv.c write_csv.c forward_propagation.c back_propagation.c mlp_trainer.c mlp_classifier.c)
INCLUDES   = $(addprefix $(INCL_DIR)/, read_csv.h write_csv.h forward_propagation.h back_propagation.h mlp_trainer.h mlp_classifier.h parameters.h)
CFLAGS     = -g -Wall
EXECUTABLE = MLP

# Generate the executable file
$(EXECUTABLE): $(SRC_DIR)/main.c $(OBJECTS)
	$(CC) $(CFLAGS) $< $(OBJECTS) -o $(EXECUTABLE) -I $(INCL_DIR) -lm

# Compile and Assemble C source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INCLUDES)
	$(CC) $(CFLAGS) -I $(INCL_DIR) -c $< -o $@

# Clean the generated executable file and object files
clean:
	rm -f $(OBJECTS)
	rm -rf $(EXECUTABLE)*
