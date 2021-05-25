.class public Landroid/support/v7/widget/AppCompatCheckBox;
.super Landroid/widget/CheckBox;
.source "AppCompatCheckBox.java"

# interfaces
.implements Landroid/support/v4/widget/TintableCompoundButton;


# instance fields
.field private final mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    sget v0, Landroid/support/v7/appcompat/R$attr;->checkboxStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    invoke-static {p1}, Landroid/support/v7/widget/TintContextWrapper;->wrap(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-direct {p1, p0}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;-><init>(Landroid/widget/CompoundButton;)V

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {p1, p2, p3}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->loadFromAttributes(Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getCompoundPaddingLeft()I
    .registers 3

    invoke-super {p0}, Landroid/widget/CheckBox;->getCompoundPaddingLeft()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    if-eqz v1, :cond_e

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->getCompoundPaddingLeft(I)I

    move-result v0

    :cond_e
    return v0
.end method

.method public getSupportButtonTintList()Landroid/content/res/ColorStateList;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->getSupportButtonTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method public getSupportButtonTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->getSupportButtonTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method public setButtonDrawable(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatCheckBox;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatCheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setButtonDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    if-eqz p1, :cond_c

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {p1}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->onSetButtonDrawable()V

    :cond_c
    return-void
.end method

.method public setSupportButtonTintList(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->setSupportButtonTintList(Landroid/content/res/ColorStateList;)V

    :cond_9
    return-void
.end method

.method public setSupportButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatCheckBox;->mCompoundButtonHelper:Landroid/support/v7/widget/AppCompatCompoundButtonHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatCompoundButtonHelper;->setSupportButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_9
    return-void
.end method
