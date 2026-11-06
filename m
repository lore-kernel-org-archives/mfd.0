Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944156;
	b=WdAzG/p6SP8Ksp/fMCisvK+WvEvb2K4ZK5OMJuYTafIviH32TzlbRYHDQg3pyWQ0pHPx
	 AfkDqvfP7JGXnZumzz4L7k/ZqZ9ReISk+2prl4zx3e8N7+oYuHYSdgpVC2MXTCF5wV+UL
	 EhXuTsJDJ890MB8raEHJeZ7Vll7hqQxRs21d+9vgGEoc6Nexo5kDnatILpAG6Fc93VMUm
	 jFbQITT/0b9bnw/h/6VxkkRuNSLnZeVCWEBpiNyqdQ16agNY75vL8YqYxMbahRAndGlSj
	 eFSBvTtWwZwKdhZ6ElFc091MnUAzc4XAeli6RJ5Vj04AHqetzgczRArBL7vtaEveMVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944156;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CIFwGj0TgQmvIasdOsEJrtF4rzxiCHSBCS/tghIr4+A=;
	b=YgEJ55VZYLLEe+xcH0nCHBjE4YVCF0pMsUPuC5vI6mnvdqhenvYAOOeVe1Fm9Akh95Xv
	 mEyCGnXcSipPohTsuWToeQkAEI1cUUrrwGeKDaZNFp8rpcCVdXbBIs7JqAz7cWhnf6YMk
	 y1aZb3lARlgl+xwPiw8sPRiwwahA6es47CeoTiYDC/FC4ZGe/clLiyj8Q6vrR8vO5BMe2
	 1q/XF05liWvY93vtCPu48L/RycW4TK9hIWg5I83Z6Fo31ryaO6UEBRPWsljTnIppYYRHY
	 DEVJ85E3fGs/phZroSaaYXr4zbQ1qAv6KksVyZYMpBgDVOgbAsMN6SYRAcOepZWp1Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SrMiKIAH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD66606A326
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SrMiKIAH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099591F0089F;
	Fri,  6 Nov 2026 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793944155;
	bh=CIFwGj0TgQmvIasdOsEJrtF4rzxiCHSBCS/tghIr4+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SrMiKIAHkoFqa8UdXQIIVQRarcHAvdm0k1hh9FWZzByUu6E9Bhq3+/fyh06Q1SvZ0
	 H48qrzcPQ8LfRJNQB00cSh+wiWoVj0dAqqEaInKl8yuZc8heiB8VNKaw5WESeBBC0x
	 zE9eHHmpes3yKFCNbwTA6hq35Yrxdm58w5R6VDseLxkjn+iO6/9z8T6aKI/j1hhmHa
	 9xMQElvA4+M7YF79S423yYjyVUPooHrMIj0AYCeAft81+cmT/Kp9Q+71k4xez84esT
	 37pckhuMpJMINPn5FSMST2KMAEiNocAg/c8Y4Tyzry2LpXOhe813jZ5czehLamiYVz
	 A9NxlpxtUXumQ==
Message-ID: <sashiko-outbox-200855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ASoC: arizona: convert audio pdata parsing to
 generic device properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-arizona-asoc-v1-1-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
 <20261105-arizona-asoc-v1-1-25ec7338446e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:49:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Switch audio platform data parsing in the shared Arizona ASoC helper
> from OF-only property APIs to generic device property APIs so audio
> parameters can be provided via software nodes or ACPI in addition to
> Device Tree.
>=20
> Align the audio configuration array types in struct arizona_pdata with
> generic property types so properties can be read directly into platform
> data, using boolean storage for out-mono flags and bounded array reads
> that preserve unspecified trailing elements. Drop the CONFIG_OF guards
> and obsolete error checks around the audio property parsing calls in all
> Arizona codec drivers.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-arizona-as=
oc-v1-0-25ec7338446e@gmail.com?part=3D1

