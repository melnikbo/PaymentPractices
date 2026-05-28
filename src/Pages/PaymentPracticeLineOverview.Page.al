// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

page 692 "Payment Practice Line Overview"
{
    ApplicationArea = All;
    Caption = 'Payment Practice Line Overview';
    Editable = false;
    PageType = List;
    SourceTable = "Payment Practice Line";
    SourceTableView = sorting("Header No.", "Line No.");
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Header No."; Rec."Header No.")
                {
                    ToolTip = 'Specifies the payment practice header that owns this line.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the number of the payment practice line.';
                }
                field("Payment Period Description"; Rec."Payment Period Description")
                {
                    ToolTip = 'Specifies the payment period description.';
                }
                field("Company Size Code"; Rec."Company Size Code")
                {
                    ToolTip = 'Specifies the company size code.';
                }
                field("Pct Paid on Time"; Rec."Pct Paid on Time")
                {
                    ToolTip = 'Specifies the percentage paid on time.';
                }
                field("Pct Paid in Period"; Rec."Pct Paid in Period")
                {
                    ToolTip = 'Specifies the percentage paid in period.';
                }
            }
        }
    }
}
