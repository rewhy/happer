.class public Landroid/support/v7/widget/DialogTitle;
.super Landroid/widget/TextView;
.source "DialogTitle.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 9

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/support/v7/widget/DialogTitle;->getLayout()Landroid/text/Layout;

    move-result-object v0

    if-eqz v0, :cond_42

    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    if-lez v1, :cond_42

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v0

    if-lez v0, :cond_42

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/DialogTitle;->setSingleLine(Z)V

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/DialogTitle;->setMaxLines(I)V

    invoke-virtual {p0}, Landroid/support/v7/widget/DialogTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    const v4, 0x1010041

    const v5, 0x1030044

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    sget v2, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    if-eqz v2, :cond_3c

    int-to-float v2, v2

    invoke-virtual {p0, v0, v2}, Landroid/support/v7/widget/DialogTitle;->setTextSize(IF)V

    :cond_3c
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    :cond_42
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .registers 2

    invoke-static {p0, p1}, Landroid/support/v4/widget/TextViewCompat;->wrapCustomSelectionActionModeCallback(Landroid/widget/TextView;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method
