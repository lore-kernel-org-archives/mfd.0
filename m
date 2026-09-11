Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79530567B
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153182; cv=none; b=uqt4qiuid8JL7i6lImY9HBeAoSROV8WMZTW9pfFM36949W9gJQSmhhUNjVPt1UHVwbH8qfuQNwa7kbkGWYYW+8Z6GFJykyjscIa7uo/0L/5CZgeUjy5AVv+ZkacNehCVQ4zGbUGVjWC1yCvXeWFnA+VlWxTqKMKjKxpID+nwdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153182; c=relaxed/simple;
	bh=D59hJfSpuO3IXvkumEmY8Ft0p0fOr1g/07AdrX+fgWQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V7Pj5SYLpb3dJ+5rYDOTBQfo/X27buhsw/LMHuxk43gBUgfBFBWOmefHuC59iSuQtxafNPr/Ujq0EbhaxFR1XaT80i6ov3+i7qMiX49yGTKUVeW3j+EOuIbjKI9Fwr809x8wyAVWzDMTlhsjs4WJo6wkavDepSX5DWCHV1dKd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4xvbO0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4xvbO0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276951F000FF;
	Fri, 11 Sep 2026 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153181;
	bh=D59hJfSpuO3IXvkumEmY8Ft0p0fOr1g/07AdrX+fgWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4xvbO0y2o0TSpxrmFvAaeXvgB/P6xGvuxbnaUaGAyIiadgz0vynXwiKIqo9pNmou
	 h3FOARoZIsY/O+X94HPCyVW9mbCyvjH6E/1y/IxVarD1REw7Z6LA5f5w9T7lI9z3ZZ
	 AK6FpeK8ExsRciB3gSU1yMlxivN0e+xfcDC7Erv70FENZVuahUon40AWC0UU3lcVTv
	 Bm8mY71ceJRb46+AzmGx8fntXg044YygxpHgl9Ul/fUx4sL507Q26DyXDCQFbYzICj
	 ntKcSMfsZD8+DHWhTkEblWXjfdD4pFoAsNUGGjnNSRRkvX/dE6RrBNzEHRX4mfIpW8
	 s0X3lo36/I6Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 9/9] i2c: cgbc: Register known I2C devices on the bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-9-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-9-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:59:40 +0000
Message-Id: <20260911185941.276951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Register any I2C devices defined for the bus at probe time.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D9

