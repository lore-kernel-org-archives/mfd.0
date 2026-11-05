Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877722;
	b=zaqzi2jfXHGMAEslE5a6S0icE8Ckn5CndMCGVei4oCh8/It/raiH7xlRhvbpkRI+T2nB
	 ZzTLrEB8A8p2D6W8Zh6I9kMooSx/mTkeIeqi+P/oqY0rs8bTQXT8sidXsa5cUd6m4jGl/
	 VoaMOHd/Ha2hHSz1xckxleXpDnIGj7Qz4hE+QnspXnbmLBClDgYNxFqioto1qxPzKje61
	 tm4GiMm8waoIqFak/L4MRcZBDHku3hjiEWgIc1PkVNw0uNpOj8z+sQ2hbWz9P/hKDhVoz
	 PGesMA3+hNzlq1zW4yEfGWrt3IziPKRIo4edsKzhlCBOwo/UYEp3JVMByrNBPQLAPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877722;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Wnru5420Zcxz4WAQQ4FKeKBcqw6nOqQESLBLIU2fc7c=;
	b=qbuopVJCBGBgx1+u5nWdpbKYV49GjTCAxh2GOYXrHjLX4vnKFKTKKDuz2pk0a33Tsk0u
	 wDW7h/mYCnr+TbSG8tOrY6zrJGpwGJT3TQdYFiF8Uy0jfVGEwtRbVSiEQMGXRd23VsIxn
	 tlGx+t6aElFCmZghUa4fpVH7Hq8jEnZt0tHjRhnymwSmcVR+dWFUF7Bbd/oiPoKyS3A6g
	 YHSD4zaO3eQwf42LvOpWqCgFwLK0UT7upntAJjP0YJOZrdhxaUvIXb1gx96OCkcfS31Oq
	 Ys0F7L+WMrOW9xPnkwOW1OBs6Zc47QWAJweoK7ijxv1pdFY1V6O9bKszbfgcBiAb5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Agv1rNpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96326606A31B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Agv1rNpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5541F000C1;
	Thu,  5 Nov 2026 11:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877722;
	bh=Wnru5420Zcxz4WAQQ4FKeKBcqw6nOqQESLBLIU2fc7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Agv1rNpKTUoPLmzO8R/Mh5e6WG4DjBsA7iB03GM9/TMijy5WZ5AoDhiMXHEQ/K+c7
	 2dCSsu49oG8oqwxeOUg76ZpRSruO+0OjPY4OYctYn6alWrnHwE2mZHqjIHIxKpk5Vp
	 5xUEbDA+WimazI8Yv5I7nTorD0FM02iTgH38/3ySvWTsqWKIOnPWIBDj+7PRfL6ZzC
	 wJbfdwT2fdsR4O0HxxQSLA2elsWUBWoPmhG//fjlMWmFuxWwMaIYuihqxgByadOu3V
	 zYEdTn/B5yvDfqE5oiDgY7EX+PmrJYozWZxoNlpTk/PxToRyJ7kfP/OoTtpigli2S4
	 DYuiP/a50rGAQ==
Message-ID: <sashiko-outbox-198939@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/3] i2c: qcom-cci: Support the CCU output mux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-ccu-v1-3-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
 <20261105-ccu-v1-3-3accc4b901de@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:22:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> On SoCs such as Nord, the CCIs are wrapped by a CCU. After reset, the
> CCI I2C ports are routed to the CCU, and the CCU output mux must select
> the CCI before any transfer can take place.
>=20
> Get the mux register and bits from the optional qcom,ccu-mux-sel syscon
> reference and select the CCI at probe and runtime resume, right after
> enabling the CCI clocks and before the CCI is reset or configured, as
> the mux register is not retained across power collapse.
>=20
> The mux register is accessible only with the camera subsystem top power
> domain and AHB clock enabled, both of which are CCI resources. The
> syscon regmap serializes the accesses from multiple CCI instances.
>=20
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-ccu-v1-0-3=
accc4b901de@oss.qualcomm.com?part=3D3

