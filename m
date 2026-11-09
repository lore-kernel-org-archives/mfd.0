Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217930;
	b=M2C95vsVlUg+qhbv+Yh3+TmYA7J566mW4JcgnkayW+zQ23soe/GcBHZWnm66bJwHBAh5
	 ARxvVmSZwUFH+HAozo9yAUVbvmWccCDQzMKt4e+67qprmbRgn/g0awwQtiJ2t/H9n6pNz
	 SxV3P8o3iHs+5RbItUoSxrPM0l8BhNjmTgS+MZGI6B8pG7PBAjq9cRFFpfFlgnSHVCBaD
	 mPQt6YqACz/PDwg6IvXedtO/0C1K+cJHF7iTQuULUFn7zSG/crKszHlGc7puHXZA5wLXl
	 x6TYqCuAD6dwXf2E0E7SrTf4uKdlYMmwsyEz6Ok8c/jvA/CXWRKDAr1zKmhYsSGo4gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217930;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=57t90aqqXwQ0FviiKPNB1CIjTc0XD1NqidZYMV2JKro=;
	b=grwyZDCGN45NZXgE0F/a909xWumCoVR4br4fiq2SMw9LcKjlzn1Kf49yr/xgX7AvQqrw
	 TBWvUXk/JWp1pNIoKwrGNyxyLwF4mwcksBG78Qw7c3IvdhycpvdJr7ZahIEtP+zLyCbVl
	 LL5XtfB98OnopufcBWPnq9UKKvClvkrRh1u31e5rWRCGwKxvFu2WDsffKJjILSqBinrf+
	 TBsDEgNjDxmJhcCMwXjnlOk2jRhoy0jm2pHqxJKzlyPMMJ8m2PRcmbYSHr9SdMLeSa0O4
	 53gWOCuH3v26H66LSfHHJaoQiCCz5pmeMqUWIufQw364SPnqBn8py21+T0XyXGLA9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFpyFZo8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3D606A332
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFpyFZo8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA851F0089F;
	Mon,  9 Nov 2026 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217930;
	bh=57t90aqqXwQ0FviiKPNB1CIjTc0XD1NqidZYMV2JKro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GFpyFZo8mPTHkr+rOFzjoYk7sjhrrRfjbAEJDkHzC73e324pPbbbB6T5R7/CSmakN
	 12U7j7XeeGfigwZZW8zIx3Wyl7VCDdbEkmptDF5EA7xTH3/8wZEohh7dNxlCmLNxVp
	 69FDmc74VUcXz8eMPfciLWkAx3gGJXGEc/AGBz4wG1z4JnFf30l3C2XP17AwvTd24r
	 oBBJa4lz9aYhhsFolHT+tMUUDEdcPQ+OR8+rc/tW4TtCn5LF9jR/TuBdQnSn9rf40R
	 cCm2cj4AQ6HJ/MztfFRP0tMC70Tfac5x1r1f3hMLyDPaUZZOKQ3eR4/M9maNuCkah2
	 nHDa+CXsN54GQ==
Message-ID: <sashiko-outbox-204755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Clamp latency tolerance to the
 register value mask
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <82545EC5E5ABC9F0+20261109094242.3783672-1-raoxu@uniontech.com>
References: <82545EC5E5ABC9F0+20261109094242.3783672-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:52:09 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> The PM QoS latency tolerance interface accepts non-negative s32 values,
> but the LPSS active and idle LTR registers have only a ten-bit value
> field. intel_lpss_ltr_set() selects the larger scale for requests above
> 1023 us and ORs val >> 5 into the register without limiting its width.
>=20
> For a request of 32768 us, the shifted value is 1024 and the latency
> value field becomes zero. A request of 100000 us leaves only 53 in the
> value field. Still larger requests can set bits outside both the value
> and scale fields. Thus a relaxed latency request can produce a much
> stricter tolerance and unnecessarily restrict power saving.
>=20
> Clamp the shifted value to LPSS_PRIV_LTR_VALUE_MASK before combining it
> with LPSS_PRIV_LTR_SCALE_32US. This saturates oversized requests instead
> of wrapping the field, matching the Intel LTR handling in sdhci-pci.
> Negative values and PM_QOS_LATENCY_ANY retain their existing handling.
>=20
> The supplied fix was reviewed and this commit message prepared with
> OpenCode AI assistance.
>=20
> Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS device=
s")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/82545EC5E5ABC9F0+20=
261109094242.3783672-1-raoxu@uniontech.com?part=3D1

