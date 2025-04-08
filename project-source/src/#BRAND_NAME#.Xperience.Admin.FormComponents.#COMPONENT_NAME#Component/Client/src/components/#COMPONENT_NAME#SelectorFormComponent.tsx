import React, { useState } from 'react';

// Imports required for the component goes here


import './css/#PROJECT_NAME_MODULE#.style.css';

import { FormComponentProps } from '@kentico/xperience-admin-base';
import { FormItemWrapper } from '@kentico/xperience-admin-components';

export const #COMPONENT_NAME#SelectorFormComponent = (props: FormComponentProps) => {

    const handleOnChange = (value: string) => {
        // If 'onChange' is undefined, do nothing
        if (props.onChange) {
            // Passes the new user input to a parent component where all field values are maintained.
            // 'value' emitted by the plugin onChange event stores the most up to date input of the component.
            props.onChange(value);
        }
    };

    // Renders the color selector and ensures propagation of the selected value
    return <FormItemWrapper
        label={props.label}
        explanationText={props.explanationText}
        invalid={props.invalid}
        validationMessage={props.validationMessage}
        markAsRequired={props.required}
        labelIcon={props.tooltip ? 'xp-i-circle' : undefined}
        labelIconTooltip={props.tooltip}>
    	
	{/* Custom logic goes here. props.value should be bound and handleOnChange method */}

    </FormItemWrapper>;
};