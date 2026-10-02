Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036D36654C
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940218; cv=none; b=KVwSna2KtMPyyUerrCoeut2OOhVtRkT4KTNEPeTcAaCRuRTO09XQ+tJ4TSpFI9k+RAciPxqM0jHO0IRp8X1cY6yotJSd+sGo6HZ7FpU/ifB+7BR+cLSY7u0IP5P9j0enqxOI9rpVmQli5Cdqizdg4PogoRiQ0+nAlEmQci8Fito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940218; c=relaxed/simple;
	bh=R6RQG3raFTDjoXazfGR9LuF7o6+cI59fSdXr98gQkzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D5o7yWwQmc5Ve19l80+hjac0rf8O28pLnWYULcwzEmny9T9oMYNSTWwiwyILkXxXBVMoFfhdigmZ9UsynaXHYXba8H1nPTftH1pD/DjCoUp4N5w01935BlO7uOGLFDqNQiBIpurQsz7VkOsheTygkaOaoL6m1qDCW7UUCuUTOwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOiif35E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOiif35E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41991F000FF;
	Fri,  2 Oct 2026 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940217;
	bh=R6RQG3raFTDjoXazfGR9LuF7o6+cI59fSdXr98gQkzA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOiif35E69HeKVQBmPK6tcEB94KVdM8RCOScsn9EaKVsBWNwewXqL+ME+xQskqdzb
	 jLkem5s47O6i80fHPE7bwVwoNgi2MYqW2FKiEnn2YKH5CZ0DORkaQmVpVt0Ij/ejmS
	 202n8CQNbbv7o5QR2vun3luDzPT2c2BQeNFRh9cABJvsaq2Dd2/dN2bQzCcCp3QrCB
	 QVkH5mYF/deezzwnPgQ+KBI9EO6vWCKu/9vDW4jwidmhUt8ssA/0XDEicajD8EOA9v
	 qpOwFwoKTi2op/Bvs99y01gjJs2jV1pRE/mcMgJTRHwJIeXzP4SXgXO907WOWwRnCz
	 PREuT93wquVMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/9] mfd: cgbc: Use PLATFORM_DEVID_AUTO for child
 device registration
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-4-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-4-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:23:36 +0000
Message-Id: <20261002112336.E41991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Since parameters are now passed to the i2c-cgbc driver via platform
> data, the I2C driver no longer depends on the platform device ID to probe
> the correct I2C buses. Drop the hardcoded cell ID in favor of
> PLATFORM_DEVID_AUTO.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D4

