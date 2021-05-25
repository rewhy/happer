.class final Landroid/support/v4/app/FragmentState;
.super Ljava/lang/Object;
.source "FragmentState.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/support/v4/app/FragmentState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mArguments:Landroid/os/Bundle;

.field final mClassName:Ljava/lang/String;

.field final mContainerId:I

.field final mDetached:Z

.field final mFragmentId:I

.field final mFromLayout:Z

.field final mHidden:Z

.field final mIndex:I

.field mInstance:Landroid/support/v4/app/Fragment;

.field final mRetainInstance:Z

.field mSavedFragmentState:Landroid/os/Bundle;

.field final mTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/support/v4/app/FragmentState$1;

    invoke-direct {v0}, Landroid/support/v4/app/FragmentState$1;-><init>()V

    sput-object v0, Landroid/support/v4/app/FragmentState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/app/FragmentState;->mIndex:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    iput-boolean v0, p0, Landroid/support/v4/app/FragmentState;->mFromLayout:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/app/FragmentState;->mFragmentId:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/app/FragmentState;->mContainerId:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/FragmentState;->mTag:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_36

    const/4 v0, 0x1

    goto :goto_37

    :cond_36
    const/4 v0, 0x0

    :goto_37
    iput-boolean v0, p0, Landroid/support/v4/app/FragmentState;->mRetainInstance:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_41

    const/4 v0, 0x1

    goto :goto_42

    :cond_41
    const/4 v0, 0x0

    :goto_42
    iput-boolean v0, p0, Landroid/support/v4/app/FragmentState;->mDetached:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_51

    const/4 v1, 0x1

    :cond_51
    iput-boolean v1, p0, Landroid/support/v4/app/FragmentState;->mHidden:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    return-void
.end method

.method constructor <init>(Landroid/support/v4/app/Fragment;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    iget v0, p1, Landroid/support/v4/app/Fragment;->mIndex:I

    iput v0, p0, Landroid/support/v4/app/FragmentState;->mIndex:I

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    iput-boolean v0, p0, Landroid/support/v4/app/FragmentState;->mFromLayout:Z

    iget v0, p1, Landroid/support/v4/app/Fragment;->mFragmentId:I

    iput v0, p0, Landroid/support/v4/app/FragmentState;->mFragmentId:I

    iget v0, p1, Landroid/support/v4/app/Fragment;->mContainerId:I

    iput v0, p0, Landroid/support/v4/app/FragmentState;->mContainerId:I

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/v4/app/FragmentState;->mTag:Ljava/lang/String;

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mRetainInstance:Z

    iput-boolean v0, p0, Landroid/support/v4/app/FragmentState;->mRetainInstance:Z

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    iput-boolean v0, p0, Landroid/support/v4/app/FragmentState;->mDetached:Z

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mArguments:Landroid/os/Bundle;

    iput-object v0, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    iget-boolean p1, p1, Landroid/support/v4/app/Fragment;->mHidden:Z

    iput-boolean p1, p0, Landroid/support/v4/app/FragmentState;->mHidden:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public instantiate(Landroid/support/v4/app/FragmentHostCallback;Landroid/support/v4/app/FragmentContainer;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/FragmentManagerNonConfig;Landroid/arch/lifecycle/ViewModelStore;)Landroid/support/v4/app/Fragment;
    .registers 9

    iget-object v0, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    if-nez v0, :cond_97

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentHostCallback;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    if-eqz v1, :cond_15

    iget-object v1, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    :cond_15
    if-eqz p2, :cond_22

    iget-object v1, p0, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    iget-object v2, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-virtual {p2, v0, v1, v2}, Landroid/support/v4/app/FragmentContainer;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object p2

    iput-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    goto :goto_2c

    :cond_22
    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    iget-object v1, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-static {v0, p2, v1}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object p2

    iput-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    :goto_2c
    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    if-eqz p2, :cond_3f

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-object v0, p0, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    iput-object v0, p2, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    :cond_3f
    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget v0, p0, Landroid/support/v4/app/FragmentState;->mIndex:I

    invoke-virtual {p2, v0, p3}, Landroid/support/v4/app/Fragment;->setIndex(ILandroid/support/v4/app/Fragment;)V

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-boolean p3, p0, Landroid/support/v4/app/FragmentState;->mFromLayout:Z

    iput-boolean p3, p2, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    const/4 p3, 0x1

    iput-boolean p3, p2, Landroid/support/v4/app/Fragment;->mRestored:Z

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget p3, p0, Landroid/support/v4/app/FragmentState;->mFragmentId:I

    iput p3, p2, Landroid/support/v4/app/Fragment;->mFragmentId:I

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget p3, p0, Landroid/support/v4/app/FragmentState;->mContainerId:I

    iput p3, p2, Landroid/support/v4/app/Fragment;->mContainerId:I

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-object p3, p0, Landroid/support/v4/app/FragmentState;->mTag:Ljava/lang/String;

    iput-object p3, p2, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-boolean p3, p0, Landroid/support/v4/app/FragmentState;->mRetainInstance:Z

    iput-boolean p3, p2, Landroid/support/v4/app/Fragment;->mRetainInstance:Z

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-boolean p3, p0, Landroid/support/v4/app/FragmentState;->mDetached:Z

    iput-boolean p3, p2, Landroid/support/v4/app/Fragment;->mDetached:Z

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-boolean p3, p0, Landroid/support/v4/app/FragmentState;->mHidden:Z

    iput-boolean p3, p2, Landroid/support/v4/app/Fragment;->mHidden:Z

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iget-object p1, p1, Landroid/support/v4/app/FragmentHostCallback;->mFragmentManager:Landroid/support/v4/app/FragmentManagerImpl;

    iput-object p1, p2, Landroid/support/v4/app/Fragment;->mFragmentManager:Landroid/support/v4/app/FragmentManagerImpl;

    sget-boolean p1, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz p1, :cond_97

    const-string p1, "FragmentManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Instantiated fragment "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_97
    iget-object p1, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iput-object p4, p1, Landroid/support/v4/app/Fragment;->mChildNonConfig:Landroid/support/v4/app/FragmentManagerNonConfig;

    iget-object p1, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    iput-object p5, p1, Landroid/support/v4/app/Fragment;->mViewModelStore:Landroid/arch/lifecycle/ViewModelStore;

    iget-object p1, p0, Landroid/support/v4/app/FragmentState;->mInstance:Landroid/support/v4/app/Fragment;

    return-object p1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget p2, p0, Landroid/support/v4/app/FragmentState;->mIndex:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Landroid/support/v4/app/FragmentState;->mFromLayout:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Landroid/support/v4/app/FragmentState;->mFragmentId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Landroid/support/v4/app/FragmentState;->mContainerId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mTag:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean p2, p0, Landroid/support/v4/app/FragmentState;->mRetainInstance:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Landroid/support/v4/app/FragmentState;->mDetached:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    iget-boolean p2, p0, Landroid/support/v4/app/FragmentState;->mHidden:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    return-void
.end method
