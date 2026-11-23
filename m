Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402382;
	b=o2vt86f0LR28cLQe3CsCyW1gZJT86HtaySbqk3paT/9XLNzvve8P8kVyt4r4GzYscldw
	 HFwUK5MTDQtfigtmrdFyVIMvSR0ZOny3ufDAiCqdpeJAANOQkAsqASqIkD/JlePWneptT
	 t5O1Zg0JP0fYGZhGB8AznJGeKjOTzB1lLFEIRbQjMoEytdaoJu+DlE6Kjqn0HS795XOCD
	 CclrgI1Nv/Q7xowEussgogC3GK40XzWSdR956VWwHms1cEAZsAT/A3SoatiY9+u6lnAPt
	 H8usfFzzNdBC2coxeWb3ej0fPwOhlgwuZzuNmKOs1JP9dW8mQAqmQz65TxbRTl2M7ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nXQn7KFkjnTsVx+3CdaPP50cr6KNN18aCsRoVgfaFtY=;
	b=JA19Vn5AjeaVDoqj4wpEjUA5Je27vsw5K/+Fq5A6Jb+byLoggOI5VKUdKnce8o0xOgBo
	 OvkSzHuIDw6oMZP80jEQoAm0FSluknPYgWk3bPFZ7OMiyXzXWanelOgs+fno8kYsqk59B
	 9JUITPdHdDNg+eIxfeciNrcRJZunM02HUgp8nBSd9sDRi/JXXNMDpBQDkCkqup1qCWBlf
	 gci+L3UObSh+uVtrnBR6mGNWCtTInRf7NLGTcs5ICfOmhCZ7JIgzZ2Y416LxM7CcvHyMx
	 oYo+1Q9nioi3F9EIxL/wG0BDjNXVY/PoBmR666Xge3mdoJQo3J0oh/m4uUZ50FT6k9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=noFzdIIJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3609A606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 02:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=noFzdIIJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F711F000C0;
	Mon, 23 Nov 2026 02:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795402381;
	bh=nXQn7KFkjnTsVx+3CdaPP50cr6KNN18aCsRoVgfaFtY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=noFzdIIJ5bh0HehlGZYYRvv8KllGie3xLtcz/QZEk/W4YGP3GC0tjiO1iC2z8Jgaw
	 IuNggIyH236biRrm9Q2r/wvWi9mYortnrkZ/d4nZZ5wbYMSyIp0c9KbCyjJ+Mhr1Lb
	 nFnl/iX625SvUoorDDkdjqvR10FCArnwaalA2uFjvVlguieEohVd8clWIMwv+YeGps
	 v8VUZcxy6uLCwJ12FY3na4mFiMToLWQOrxpCO4B2t17fuwmF6MsjnX3Z5D/cAT9Gxb
	 YsDwEkMm6iqiz1klItEITGVk7dXlvdhKXcmVEG4LD1yqRYQ4uKwsfpCDTqP2PEJ1wO
	 u4QzHF5E0hyKQ==
Message-ID: <sashiko-outbox-228570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123025022.1761-1-laixiangwu@cmss.chinamobile.com>
References: <20261123025022.1761-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:53:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Scope the lookup to the UCSI block and mark the node pointer with
> __free(device_node), so that the reference is released automatically
> when the block is left.  Keeping the lookup inside the block also
> preserves the short-circuit evaluation of the original condition:
> the device tree is only walked when the EC_FEATURE_USB_PD,
> EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
> every probe of every cros_ec device.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Suggested-by: Benson Leung <bleung@chromium.org>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123025022.1761=
-1-laixiangwu@cmss.chinamobile.com?part=3D1
