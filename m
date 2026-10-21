Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585487;
	b=22fRC/l8fZUbCReT4GFRFbY/QGmOt/nFLoZaXVs8o9P3YbV0gLsHWkRN0qBSyufN+bAy
	 CigpcYgGWLKekYM616sjERoPB+tNcdMvvrSP+t7KmqPNNBqEP0+oFgwpjugjN6FdgmLOP
	 sjCYGQfn7hUKzR4jcv+5EfkyC6/ftHQihBlQ48u6AyzBGEwS+KK2Jd32lsQG4ZnZ/AEox
	 wN+J45JDwJh09mue7bya53pMHabNdIpgVsqEdpGm7o35i7T3c683FKwjJpBzZLL9WCzNv
	 6bSrOP9tU0GzBD5WvW4YBaj1aCrKwSFCbGNdcHCn1wm8UweO45gMe4/ZkagXRwSClOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585487;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wLWpPJitIxv5EFHGBKQtpuvgB/q4B7cixzRQ5Snm2Ws=;
	b=Zma6By2B3UHXszlWqjVRxVAQjscd0eFITxvccMWBm6Mw33/rxtRPirk12E4fTdWIc0u3
	 Gtj8Oua3LmpAQgwvopTVJTVTZFsKnzkoKm38lup6QGC9kFyuGnBujg6SU/zlGHlRyuCOz
	 kjNX/+znpux3ytrqnqiWbhGOA/e5yUKDvFvheKyi65VbXzJNICP6UinSVWVVec/ALGiY9
	 ojrWLvImCNoGCN71YukaIUIqs9lU0ezKiA8xG3u0RrUgEGO44XtN5fYWlZvMbXwhCsdwR
	 TaXv5nzSrbS7ugIKYFduI2kNL1D6w0Fk6jDnotl0AjmAQxF1w7GH6Shci/WigVNKH3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Th92Z4hn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3593E606A328
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Th92Z4hn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E4F1F000C5;
	Wed, 21 Oct 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585487;
	bh=wLWpPJitIxv5EFHGBKQtpuvgB/q4B7cixzRQ5Snm2Ws=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Th92Z4hns3fSyiapB+VJeM9nI40P4xodpVxA35Vkmp7Vei67fyOukH42x5yNARcaJ
	 l0VoWW9WUPzi0HvjEs1DRos2kTBDzq6F8Ano9sV7d7BufG7fAbap+Gsw3t98wiyOD/
	 rGOoxdoqeazfu5WmVF3t3hnuoaaiCuiAn6TYONxquH/LW7MpOofFFJbhiCBBqEk+fC
	 6ITO0E3x1JY8xurzIhysmTSv6QyD2YoMhs2LxkeTGKmeQMyT8FBh4Krsg/UD4No/W2
	 p/P6iQ5XPesCrIr2hoznQWrn7wEAtt5Kff2q4Xn1IV2oBp7ueV5GuBdmRBHj31W7P3
	 T7lL2bSqG0oWQ==
Message-ID: <sashiko-outbox-180246@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/28] mfd: ab8500-core: Register sysfs attribute groups
 via devm_device_add_group()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-23-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-23-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:24:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ab8500_probe() registers up to two sysfs attribute groups with
> sysfs_create_group().  On AB8505 and AB9540 (cut 2.0 and later), the
> second sysfs_create_group() call unconditionally overwrites the return
> value of the first, and if the second call fails, ab8500_probe() returns
> an error without removing the first group.  Because the driver context
> is freed and driver data is cleared on probe failure, reading any leaked
> sysfs attribute dereferences a NULL ab8500 pointer in
> get_register_interruptible().
>=20
> Register the attribute groups via devm_device_add_group() and only
> register the second group when the first succeeds so that devres
> automatically cleans up registered sysfs attributes on probe failure.
>=20
> Fixes: 93ff722e8853 ("ab8500-fg: Add power cut feature for ab8505 and ab8=
540")
> Closes: https://sashiko.dev/#/bug/linux-a9ac1a9d-5a97-4ad3-b4c5-c7775c24a=
333
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D23

