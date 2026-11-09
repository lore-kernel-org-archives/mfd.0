Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236562;
	b=QEbGANEIig5HOtfOUPSGu2GKuY3/9qnzgXTusW9X3uZ1/7VM+Q3inA2zGpzYBe41LTof
	 3KaY1o0YfBpMFM4xr1LQvLOWAxa4K4Ru8DNdzjkvBPyTugngF8Tw7kEVb+Ce14E1WLM4h
	 /uAmtaYOPKwszAUellUVOnozBzdFPgJh4l3+okSFsE8jetYFZOnk/7J1o29f7f9NY2KBm
	 X6u4G3GtZI7Z+Ce/aEFMghNwFSlPnnLkMuEnseRD7Hh0RcmcXYOdRCHFjNqmuMwtF+Nd2
	 ZDIVdSAfjkaZmAgnVGljpFprvoqNDZnEdLZNkrnz+o311+/HxrMl341VeTGMfIdXU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236562;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j9ouR7Ox+HR/MKMW00XhgXnhvlSgzfNzMrU8bUDxzPY=;
	b=W7houlXQF42ffJZJHlBW7/NMGd79O8YKQPnZx2+nQDk6uB5MFZ9vqq1v+ifNFhtKu2EE
	 LJz6dnQvoNzwOweHmFoHUmahumiUJ9567KoHtzoUBZZb4pxLYJqDi0bmmylhh+U7sp5+9
	 9Lgm73vXczJtawzjKB0XE0AQuT8b0d1QAPv4eIuzCeaYns5+3pKPD0NjngIpr5fR0nS62
	 dCjWZhcN7K5/U70hA9DCibxJHAQJWqV/4wPzXN8AC9fP/ZGP3gpa14UKdXYwUVSU0xTbg
	 i8+1BW1UP8ouAeRwrA/yMQIoTVYPia3DVL0pKTGRkYpubhvcp+8nbHIetxJuvMmg+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0bIN3cS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEF606A32A
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0bIN3cS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C5A1F008A2;
	Mon,  9 Nov 2026 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236561;
	bh=j9ouR7Ox+HR/MKMW00XhgXnhvlSgzfNzMrU8bUDxzPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0bIN3cSbFRL5CTNoDFkTZF+AekCgG5+b9b3V1PBM8mmKIoGmCGmijhCrTwervUNk
	 KHSTFCpDUNoePY338PBntme7e3H0barnZdm6248tzdmiEk4KJQ+PFu0KcXqgD29mUR
	 sdEjEr5HsGxSILW+N2v8EwWpGTCxYdlPHuuFSNa55lDSyb4n63hnokWHnqqJy7L1Q2
	 /A1xbdq/KG4ipJ6mom4Oy83/NRj/BWcBFRYbCb6IDHLxFbsnYgnoGCvq2l6jdHuPEz
	 nQae3IEtS2l8VFqlVt9XZ+4nRTyLo3XyQkWR15LqJ5h75qYMaVgxPbsiOamhtjA0mm
	 1+I41v/QmqIuQ==
Message-ID: <sashiko-outbox-205142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 5/7] power: supply: rk817-charger: Expose boot
 voltage and OCV values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-6-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:02:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Expose PWRON_VOL as POWER_SUPPLY_PROP_VOLTAGE_BOOT and the current
> rested pair as POWER_SUPPLY_PROP_VOLTAGE_OCV. The OCV value will
> return -ENODATA while the battery is not resting.
>=20
> Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D5

