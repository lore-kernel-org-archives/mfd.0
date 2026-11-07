Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011392;
	b=WqSizqC4vtlBhj9wWo+/2/OsgjANbjy+MWfaywNWgJqcRWdTCpp6POEBNgeFplTdahPr
	 W/Tbl42Asg8G95ToMIoU/e05/f2SvKcJFpUt3ncL0adzl6Kpz7vyb0w6UvNWqPX18TbGR
	 UBIw3FU6Ddo7snW2RTeIdn9l4wh2c9gtcE7uMPTm9UWaEMkqlsbj4rH5wB2ABzITYtj/U
	 DqJpeXhr4CREdIIwEG65pbTS9zvbcEyvYGj75/lMfl4mqSKS0w3qZaadsesKmIxszpP00
	 hCWYCasWEZG3MhoPGNAiUSyvtYRXwgbKUl/3H7jC0S7I7uRlqFIA83f1cSK0/xy64Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011392;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MOYfojQag0AD3liByfDdoXC5Vj68PGV2RqvdVKMZ+nE=;
	b=UI8WT5bHy9u2MbDWCqsVtJ0Y2Yazv7MkI0YJgd1DKqN2c9N3mpdXlU7hTeepGDUH6kk8
	 9L5bSYu3ngv1pWYBMDWhiZNkUdLzaHTDdFAqzGLB5sOs2xNj5Z/6+3tc7MckjBjlPCx7b
	 PRuR80mcQAVu4OmisxLodMXEzl1jo1psfEcqBGOq/NKqCxUa9FJKH87xtSpBwCxTlRO2P
	 M+3sUeqvGQPCNX4bzVXsR216UgLk254jcJ9iBrC+WC9XXjdEEL2I275foGdWduEaju3eU
	 ZNjvZnNMPFsjcNm+XDAdRe+ILOOBWVHyGqsHDKh9o7E6wJb7GkcUUnnQ8F+0ceuk7Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S86HYceF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE5606A32E
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 00:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S86HYceF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645431F0089F;
	Sat,  7 Nov 2026 00:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011391;
	bh=MOYfojQag0AD3liByfDdoXC5Vj68PGV2RqvdVKMZ+nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S86HYceF/q+hIDTvr+XlqYS1k/8frvCmbLlf2h/XZPo1IKuqDZpAaAJYZRUIvJYeM
	 9K8U8kbz3i1vMXWf4HdTzimm8JUWi9zn1rR9/DAh40YA9vXIfiyotfSVCTu0mVQd/0
	 Sf9Ct5fIVUW+KnlTD4BOqS/RVV6UccQC4bqA9jv/4WreUnXdurd6mhd4y5XDozhAeD
	 oMZRBfxw2TwKhgkNItceydy7d2eqI2FcfmVwJhetSPkTH1fwZRc1mltwAsD1WN5M6X
	 gYAPPWIo5jvmmT97zWuquvxilchUMbSIG9MY1ewroiJBGL6QsURYHRR1ZHEW5nly7N
	 6OThneR2qfS6A==
Message-ID: <sashiko-outbox-202425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: tps65911-comparator: convert to
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261106-mfd-subsys-v1-2-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
 <20261106-mfd-subsys-v1-2-1c3e755d37a6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:29:50 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: tps65911-comparator: uncapitalized commit subject
  description
--

commit 9db162a3501f36e6be987d9956c4bd3a1341e487
Author: Brian Masney <bmasney@redhat.com>

mfd: tps65911-comparator: convert to subsys_platform_driver()

This commit replaces the manual subsys_initcall() and module_exit()
registration functions in the tps65911-comparator driver with the
subsys_platform_driver() macro.

> mfd: tps65911-comparator: convert to subsys_platform_driver()

[Severity: Low]
This isn't a bug, but MFD commit subjects capitalize the description after
the prefix, such as:

  mfd: tps65911-comparator: Convert to subsys_platform_driver()

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mfd-subsys=
-v1-0-1c3e755d37a6@redhat.com?part=3D2
