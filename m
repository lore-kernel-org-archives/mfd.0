Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910913;
	b=FPUSIDrrSgt/H0tfHdap1vg0fUB3cfsceI3n+5q8z1PnNRfOxE11h0YeE81ObKvTcNPl
	 LZn9z0n9aW+LGk7MeavhYsANllGFZCFhLSo+RtMPrErswGmtQB3/1HVVcS3CqoE1X1Oxm
	 +MnhvREkFK7BJD6izdqn4ei1RHXDXZWf6mW7lJDozIgbNcKzQ5+upqW20Mznl4SDV5jIi
	 Y1zjBEitzmbyafI8ZoWzv+mReliCHlNoW8FkBrVGmlZmfUTZ5B++unOLt/r8eBfvId/dd
	 wrljCRu+Wm8W0xUUNHupx7PqSrWXxnECpmVZO/zl4VzJQ8a/LLMal3sH+Ymjz0jM4Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910913;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=409jv6t2Zk2XXsW/EPl9L2OeFQ79NSmcXiagHHF22FE=;
	b=YIZpylWXgZfXDXD5e1Ffd6NM1AHnON0Y1ggIptiSAzPmy02TocC8Ac427L1S8rUnb/5i
	 RM3vBvFlu3LWnvoqJ3ujRQiSmt+2Jq9NRukCRN9kCIPEyfaepRRxgtJnEB951s9nCH8mu
	 RioHqlFVhiP6Mmg0qtL1HdEl1NbLfNQxN9S7hmqjGKGy7KB4tNEdnGmHkjb9MvnogrKQu
	 ue62/Lsth3XTxHy5vxms2W969CkrJImSK4oIIPsfnOWhEDWnhSqQLvGoBNoQWzxApkGKy
	 GDSXNXJDty8TBonAAITXLvmd2tWyyOSpU6T+2m8ub5V69NooGGDaz1Ug1uNdKQCUJPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElhbzkTN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B72606A323
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElhbzkTN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EBA1F000C5;
	Tue, 17 Nov 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910912;
	bh=409jv6t2Zk2XXsW/EPl9L2OeFQ79NSmcXiagHHF22FE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ElhbzkTNdmbtnjLWht3sFYDShD6Uzzf/suSsrA15C8882ejSPWEBRiVT3RbQJVUg7
	 VQMchM8j9n3re8kFgKkwHnJoEi5Zw9Wm4qwVIEiQ2ITJTtrz7FSHXdj4PYUCJb5blS
	 JeOFoPTn1ntiFAnJzXMnr4sQmCqhgeco8S4TI+mW2F3rS8Tiz/qZZ16rs8a+JoEBod
	 Bb5c1nAVUTxrYjxyuvHZAINkLVAZ8xDjoT+cZn1dipeVCKcztiRWMde5NBg0K3JMyV
	 t1u553rbTDTqtorfLvd71vWpO08OrgZxZm8Sez+KumRRIZh8bDoOqBmmXMg6uPMUT/
	 AwomBBJTIXsDA==
Message-ID: <sashiko-outbox-218600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/10] i2c: cgbc: Register known I2C devices on the
 bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-10-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-10-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:21:51 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Register any I2C devices defined for the bus at probe time.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D10

