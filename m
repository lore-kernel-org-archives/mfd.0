Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2834364E98;
	Sat, 10 Oct 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648703; cv=none; b=PHgkxwzXOc9WXNudmi2uC2ccS/i+wku0zUYG1inwJb9UvPTft6H1VVZO4i3ojq06MDMcRjj97A/WbcgorTDzBIa65Yp9fWyQ2BoD4ZziKLQZLkVrJKOcmv0y1PmpKTua8k5avFuIEb+ACBrp3VBWVfZUjaZz5nWMC6DhbgEM8xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648703; c=relaxed/simple;
	bh=WEyt2hvG9O4pjpMrNlJq69lj1Ma2A6LXfgwf3NNrVtE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L92GD/h3M+Lw2ecGq86p5hswansQmRrHAacidNwYD4hYChbmRQH8+cGb24/jrZTZ7F1WtkltTkFV1E/LtcmK7HC5OrWWOCPMLE7HxtzTY6WJLHnDUrKErdPfI2XMYvW6EbEL5Irf2wDMEnnmaYZFneXLXLThwFIv365VmTPxJ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zy+2HfzY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zy+2HfzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E98F1F000FF;
	Sat, 10 Oct 2026 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648702;
	bh=WEyt2hvG9O4pjpMrNlJq69lj1Ma2A6LXfgwf3NNrVtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zy+2HfzYRFF6PuEiV4W/Tvj8e4kvvfNxP9/ZwkI1fvRrR6ir/S/7yqY+LSMf1FujD
	 DaHwf7EtQhBiqRLPrU/ANU+hyvpXPDTiNZoSri9BotbRYzQq7zRtYAs1eICHpzkgn+
	 qx3UqznpnZoV/iKM0E7N14X1Vp/rGptPxX0J4vse3BCSWMehco/++1GdTAEmd8L1ZQ
	 I5L+J621QsdVVJqRgrwYpmMdVVAvQfhqTN6+1NgbnFYYxtCLkKF2D8Vkl1AWvhJr7G
	 9Dt7VhdfcIELFPLSbxxXSgsN2v6uZl38rAW/eIwxnNeyFFAJbcwD2HLSu0axY6sTan
	 1vDSQ2jlphSLw==
Message-ID: <sashiko-outbox-166722@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 08/10] net: dsa: move mediatek DSA driver
 in dedicated directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009161102.38961-9-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:41 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> To tidy things up and better organize DSA drivers, move the Mediatek
> related driver to the dedicated Vendor directory.
>=20
> MAINTAINERS file is updated accordingly to reference the new location.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D8

