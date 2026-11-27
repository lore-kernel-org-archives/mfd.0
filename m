Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793342;
	b=4Xdn+wJOyxvjx/3P8jb6BBcm6MMHeZi4VyNzFPQb8J37ZN37H72jpI736A9labl3tFEB
	 eGFxJVD6oqT6CfHCwk+xcEowpo8R8b1a+ymw2UNsFXBYzhSvSOlJsBu2sY9Gi8JPIsxR1
	 /GP3vDUfdXgGL9QvFH7fSqZ+SynIiy6KNVafzrFtU2FuVW3LnMnrNwIATYIWedlXuhQ70
	 BIOxZHGx21vzXTps/MPDF6Iz24b8riQkDQFSBiAaCf2kYHDuzwGzPG1YmfeCXTAVFTsBy
	 zqIviEtbe0ESuI7Fi5T1WDFlIQ6akDsFf6m2EiQRZlnvR8qsRH4mcQfwyxQsVnb2kBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793342;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=;
	b=LNQT+mADougmgehb0KSorkmS4gbxbzAJ5/YWWZWVSrpa2dfd9zn/DC0pNpwp666b3UOp
	 PMH/+vZJPWi5Ux+kiJwQjE4vjIyNnvLVBs9vO/NDPvnt7kGhCxhXt9/Ul8fqkh7VJFOUz
	 6VeaSkak6x6GCyxBDzZxoFS1tWc08jrJRypgBwDzBYN5BbtwR97++OFQRkwyNzf/AV+JP
	 3sFDQHiteEC5A8hCYqp0LZqltd0OvWh6BzCyU9qGw7i0OgKh/EDQHMjFnNOgZcFHf/iih
	 wWRfbEHgtkuvKqHAJDMKUOXKjKHnKdPXFs9Th3y3jQafLSvGD4uHGsBYsfnQZftU0Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sT9JE1O0;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B51D606A6B2
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 15:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B51D606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sT9JE1O0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 639CDC6223E;
	Fri, 27 Nov 2026 15:29:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F4E56049C;
	Fri, 27 Nov 2026 15:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9827111E90AD2;
	Fri, 27 Nov 2026 16:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=;
	b=sT9JE1O0y/Q8g/zTZCiOZ51Wk1PnCeeuTAz2PjQQ/0z9s9zuyJXKDVus1SaiB9mGpE7Ixo
	R2T/xpYkSs17GEwKMBsnMv/uJ1htROw4LBTVXSerSXjj2modU1bONXI6KBapa0j/XIbeT9
	pTQRPzPwmPVxpCb3XN7Zaw8x8uXJsBLtoDbZV0Q98K+tRftUA16LjLw/GHId8/SlgEnaYz
	ADSQMr4BMGP6AMWHQrRz6J2YPgwBYmCPeMRlFaVl7tU8DWCy1/IOKmgOwLSUIFO2Mt+nP0
	MIAVlasIxNcukDy5zJglrAGUU+FxdZSjA1EaS9/5Ao/OOTQQAqP23Iam04WQZw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/9] arm64: dts: marvell: DT warning fixes
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
Date: Fri, 27 Nov 2026 16:28:55 +0100
Message-ID: <87a4mu1efc.fsf@BLaptop.bootlin.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

"Rob Herring (Arm)" <robh@kernel.org> writes:

> Another batch of DT schema warning fixes for Marvell platforms. This
> fixes most of the remaining warnings on Marvell platforms.
>
> It's best if the whole series is taken together.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes in v2:
> - Update the system controller compatible strings to avoid using the old
>   legacy ones.=20
> - Drop patch dropping 'phy-supply'.
> - New patch to rework ac5-98dx25xx 'behind-32bit-controller@7f000000'=20
>   bus.
> - Link to v1: https://patch.msgid.link/20261111-dtbs-marvell-v1-0-938788a=
ff3ae@kernel.org
>
> ---
> Rob Herring (Arm) (9):
>       dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
>       arm64: dts: marvell: Add AP806/CP110 syscon compatibles
>       arm64: dts: marvell: Drop SPI max frequency
>       arm64: dts: marvell: armada-8040: Fix node names
>       arm64: dts: marvell: Fix w25q32 compatible strings
>       arm64: dts: marvell: Drop unused USB 'phy-names'
>       arm64: dts: marvell: cn9131-cf-solidwan: Drop st,m41t80 reset-gpios
>       arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link
>       arm64: dts: marvell: ac5-98dx25xx: Rework 'behind-32bit-controller'=
 bus
>

All series applied on mvebu/dt64

Thanks,

Gregory



>  .../mfd/marvell,ap806-cp110-system-controller.yaml |  59 ++++++++++++
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      | 101 +++++++++------=
------
>  .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   6 ++
>  .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |   4 +-
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |   2 +-
>  .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  10 +-
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |   6 +-
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   6 +-
>  arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |   2 -
>  arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |   2 -
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |   1 -
>  .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |   4 +-
>  12 files changed, 127 insertions(+), 76 deletions(-)
> ---
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> change-id: 20261111-dtbs-marvell-3ae21c8ac47d
>
> Best regards,
> --=20=20
> Rob Herring (Arm) <robh@kernel.org>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
