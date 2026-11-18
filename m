Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990516;
	b=sOlOCFsCcFxPu4XbYu6MjuxprQWsc674QIScdniFmm8biL/5n3x/0LyE4QvDe6GGeaUg
	 MDhLdKSTC68SwRYABnWK4xEWb/eaZO3QRA86PFEb7ntKEiiN4ytxWen2wGI3mfARA+K2O
	 HJPKhwFnkc5LU6QcAqehV/hLha5fDC4VKjDYspxGO7pzgwWP9rMwb6T4/7Ft27JAlr6sa
	 JbeCXqakQLpABEsVTQqZ57diaZy7Iqvd7WYBSaChedxrPSTRH6P1EKq825BYuRPTCB7MT
	 QuW/xN9mnxfCOtILQScTMPg3CBCvtaLOmRocaB5W2A0NUxceI1XoTS4BHBNY+d1Z5Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pKASYStZ4/OuPjOxYn5ItXsdrYFLUeoUrNTKnox4rd4=;
	b=meG0GC7kqQbLDekHcsSkXR77E3AnJkRHRe+7iWkNILULBaobtKIx00RtsicgQZc/4+h/
	 HVDYj0QYddmmoeAFrFsGVwkFhWlZsstnA7pyt4wkhS4BQuWoVWc/FvDETh0AKEYrwRd0A
	 zmPXjtDMATH47EFUYiE98pL/yVy9/tn/kM7bBsamZg5ky+iu8inCWZ+fkju8v/nhizCIP
	 A2zk8NXIzG6fduhVhArnMDpUCESpDVCdTfaY3cDtPyfDwmD7I8ZfsQVYPLmKQxPaePR11
	 Q1tO1TlwM/zs8vs3EBYJrNENH5u7pFBqqupR4OU9PlgHiU6L5uRWyG1H2zdn6dhPdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUYzPj22;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A351606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUYzPj22
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E18C1F000C4;
	Wed, 18 Nov 2026 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990516;
	bh=pKASYStZ4/OuPjOxYn5ItXsdrYFLUeoUrNTKnox4rd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WUYzPj22K1imr/5acw2CrsxNLgRey66AZDzpb/MdVHQJaXD7eYPRoJHZA1HhfhXmO
	 GMp8N6mCkBym3LZ5RhMQkKmJv65y4JKC3IKAW2e3acPlYd7I0ni6G9EtuqYgs/x/nC
	 nZ534e9nCipxHaAWFOYvUH5EuqW/7HLcWQ/i4B3BaB1cBZcS+YnZu9lhELDG19rBgw
	 h/yeHnNWsE823TKJd7qJqVoZa6GFL9/pwtg5hyub+mBuBLRlhwh6/fVyessSlQDYxb
	 27y7lP/kxFfaa+HtMAlL3hSDE+3t+HV0Zw281eYQ7H+iYq0MQIf/ae5EVsvnz5u9H9
	 cFsVFpgk8AuLQ==
Message-ID: <sashiko-outbox-220447@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 03/13] mfd: nct6694: Ignore interrupts without a
 mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-4-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-4-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:28:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The return value of irq_find_mapping() is passed straight to
> generic_handle_irq_safe(). If the device reports a hardware interrupt
> that has no mapping, irq_find_mapping() returns 0 and the handler of
> the system's IRQ 0 is invoked instead.
>=20
> Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
> interrupts.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D3

