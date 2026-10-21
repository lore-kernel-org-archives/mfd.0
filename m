Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585715;
	b=0aI2mTKA4L/hDXNfwqA4psznpE0F2EbmF9hSgsR4NKn4MWmJOlEq5rCcAy4qPW8PcGul
	 DMKk5ImSplE570S5wK1Fq4z1nRLuCBT4lix6icFk+L27s3/dZHNYYvfgMIEL+ZB46f1NO
	 Uo+6ELN8v+YudYvY5SQkORPSG/FWv5zXC8ZwsVYex23zxsgdj1IYkrs+WIkLulT/KGWq5
	 DSql3PFmR07eUvtjV0TUtbyiscTURMrnSV7RbFHPXKeT5gQBIHxUxRLfxSxTkP0N2cb1P
	 UOo5sloZ3v6qPu0ONAokpkiE2j0gMKgXmEXlaKx7iIv5A2PYyeXu8388NkBOJTzfMTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585715;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QsZcvYfgtL+rhVwFtTEFCLhfEVzafTCRkUObbIlceJw=;
	b=VYfe7rqj1+xojXdDbQaNifUSyO8LHyujP087+FzfIdZ00m3hRyn+/FuWsg14VjGWActw
	 V3ZO5ofDVj1JxvIn+E5e5HPjkpGpNaw1OeZDCn/lsPbOQJMgH29tiqM3rK5/e9ws2JSD9
	 f1AQeFeNnjq/E3Eg4jk/P7yGHkjzLrNthNZaK4RAHtbs5UIRSPEBUiSDN/smlAoLjPUoh
	 RP9z/GbvjOJvPFGHua5iCJw9yigl9/TPvF95IHWLZc7XkTjhseICRJfwry0eD3VSkIZrk
	 t4IqGapcAfJ/w3F8geOAmg3g1gcU/7r4mGTEVhMKFrMxc2SD7CuviqlxjUlTSWJDVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nm0Q56k5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF5C606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nm0Q56k5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE011F000C4;
	Wed, 21 Oct 2026 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585714;
	bh=QsZcvYfgtL+rhVwFtTEFCLhfEVzafTCRkUObbIlceJw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Nm0Q56k5TlaQOUM9L6ua0O276F43I+lcaUG7cI/BXHZ3q1Inh5cdEc0wRnLLyWgyf
	 /gvrqcLf8tsCI8OKfH7HtbP4VZenRDije7g76T7nwtuaUUG4BxsXWFiHmySw8KkVOK
	 t100yweFYfKpzwhgOBXye3TPGD8FzGgsF0Hryql1uVkn+ddQCHfTn/vvoUV+dK7emf
	 EZZXbZCf3tr+qeIM4dF1jD0xm2xGDCBwJY0yi30Lc+oD1j+Jn6WRADjgvySB364oUj
	 dL6jcpF/qXuLf732q0dO1RDamQID2R0icpnlsy72uCREspclYKYfA6a/aTM0O5IjCe
	 GJPGu9DxojU0Q==
Message-ID: <sashiko-outbox-180251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/28] mfd: mt6397: Manage IRQ domain lifecycle with
 devres
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-25-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-25-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:28:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> mt6397_irq_init() and mt6358_irq_init() create chip->irq_domain with
> irq_domain_create_linear() before registering the parent interrupt via
> devm_request_threaded_irq().  If devm_mfd_add_devices() fails in
> mt6397_probe(), irq_domain_remove() is called before devres frees the
> threaded IRQ and without disposing child IRQ mappings, allowing an
> in-flight interrupt handler or late IRQ lookup to dereference the
> removed domain.  Conversely, when the driver is unbound, the IRQ
> mappings and domain are never removed at all.
>=20
> Register a devres action immediately after irq_domain_create_linear() to
> dispose all mapped hardware interrupts and remove chip->irq_domain so
> that the domain is torn down after child MFD devices and the managed IRQ
> handler have been released on both probe failure and unbind.
>=20
> Fixes: 6df8dd5c185b ("mfd: Add support for the MediaTek MT6397 PMIC")
> Closes: https://sashiko.dev/#/bug/linux-b296fbe4-6e83-40c0-91c7-2c31e8d22=
6d0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D25

