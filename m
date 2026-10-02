Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53A48D873
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940239; cv=none; b=HpiGla6GPZi6LLo8Ms021QoSGBYIVZ06wqQYCL3kogtJUzMKH745EKmZxKiSYI2YN2aHgdAPJ7iMihETX4wKMK5/ul0pPov1N+qnBJ0FoM6mpso0OY9YJugHBgbMnxi+aRYFM3qPfg85H8XjM4gONf7TqgHdYyT3GqxhzYANPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940239; c=relaxed/simple;
	bh=qy5QEOO78vHpiC3+nFkmOUGx/Z8/DPjXt1r+X8qgk1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L3HL0Iv9xg3SANrx10GxXO8e1PuJ4uy5JsTBHvj5Wk+q8YNJaLzMH5JbMK0GTxdtXXFisCRMCzuIOjeHLW508leflVkjY+aKhVpBFoEqxNzY1a2D90GwvAWrueKBBRbvMpZT1/PnWcOxRSFjAgpDQRa+XE0WaR/onohHYs6iUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2VY79//; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2VY79//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07D51F000FF;
	Fri,  2 Oct 2026 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940238;
	bh=qy5QEOO78vHpiC3+nFkmOUGx/Z8/DPjXt1r+X8qgk1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i2VY79//ZyYRu2E2nPOevhcxwSUsVRR2BwkAzrGqUosdG+eojewVrB+mwDeQnP6f5
	 ravCLkf5ze21AaCAOcjWnESW224of017ViICgdxeGb+9SDpnV5psFOLZeA35AegwC9
	 R5FfIB7DDkZcrV4lw/tKLwQlA7tdHh6zQ+ReUEz0lLklgndhktRpyIdu3l17qUuwzj
	 gQCFHRLFuhxOAusajIGgkaAP0eXDra00hQgpco9kQQGHM3ncBdtPu0GnfZ3cWAIlD9
	 KpgzV8XJ4C4Go6YlrSnETdq7oum4I6+oP0DRTsZcxQlwGaISBSTf5w5N79slItvo5w
	 Gj3q8g1iyhUvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/9] mfd: cgbc: Add I2C platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-2-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-2-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:23:57 +0000
Message-Id: <20261002112357.C07D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Define I2C platform data for each I2C bus in the cgbc MFD driver. Platform
> data passes per-bus parameters to the I2C driver, rather than being defin=
ed
> inside the i2c-cgbc driver itself. This makes the i2c-cgbc driver more
> generic.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D2

