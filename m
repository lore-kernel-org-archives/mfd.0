Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB644DB56E
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068600; cv=none; b=k0Gnr+l9ma/W5q+AC7X8zTGUm8VnPgdmFJ5t3XenJXbYbyCnn23TkicCHJSpCS6N+wnPaN2a5jzHTP9cNd3ijQvD+JG7hSuQz3cCIuhbXVnBfPMrZJDfrfqNe+FSiF5rw88anWBF2lIaJ5cjhr/20yBdsT+rKO7FJUx89gk3NXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068600; c=relaxed/simple;
	bh=0L/x80tnEB31KbwCMayX/erOrQI08K8LL5p1WIXAYzc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gwEDy6R8s6vVZ7GpLvwLn112b94qW03pM2Saca+Kobyg26WZsBC+UrYVmpbc6AAxIqpGv+72yamEt/nR3KGKPPqb19O7KeypeM0yRSljaIwLeyEdKxcmoArq/7TCYCqsipWVFe/z2LyIqujCIkoauLRySh+E5B54eDdBQ8rQaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSEwo1Oc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSEwo1Oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6EC1F000C4;
	Thu, 15 Oct 2026 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068599;
	bh=0L/x80tnEB31KbwCMayX/erOrQI08K8LL5p1WIXAYzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YSEwo1OcQjEi0gdRa83a8C0Sm8Qkjp6rDC3ONAKQro7X5svw7bZTSZeTgDuRYTVWE
	 /tB0FMBPsd6uRdxoi10RUzkiYIzrAmzuQYQRu+rkBlfV1E4Q9MJxx0M292CWKYhtqj
	 lsA2CseBSxtoGeLHx51GkXDp8vJvWYIvT4suu3UANIle+/98LePdUq6827d7hGNp4v
	 Q3deSkl9gtT8RKLURTOPFQIHEvhhlOZzOxv6vhwihMQT7oi//cQYuFaczgmzQf/Rc3
	 cM0BGHSIa5QWvVlgGFYe5QXOZoDeCccOqqr/WgUcSB20EZHTb6HTvuiXJazzcMHO+r
	 DIBNBp7gkKGGw==
Message-ID: <sashiko-outbox-172868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: sprd-sc27xx: pass byte length to spi_read()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weibin Liu" <liuwb@xiaopeng.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-spi-sprd-adi-exactlen-v2-1-13203b6aef7e@xiaopeng.com>
References: <20261014-spi-sprd-adi-minlen-v1-1-77fee7e64259@xiaopeng.com>
 <5e662ac5-efea-46dc-bd09-88a5a4841851@sirena.org.uk>
 <20261015-spi-sprd-adi-exactlen-v2-0-13203b6aef7e@xiaopeng.com>
 <20261015-spi-sprd-adi-exactlen-v2-1-13203b6aef7e@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:49:58 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: Commit message description formatting violation
--

commit d4626152d548143e51dd6b5098508d7a5be6a8ac
Author: Weibin Liu <liuwb@xiaopeng.com>

mfd: sprd-sc27xx: pass byte length to spi_read()

This commit updates sprd_pmic_spi_read() to pass sizeof(u32) instead of 1 to
spi_read(). This ensures the transfer length parameter correctly describes =
the
number of bytes actually accessed by the ADI controller.

> mfd: sprd-sc27xx: pass byte length to spi_read()

[Severity: Low]
This isn't a bug, but the MFD subsystem guidelines require the description
after the subsystem prefix to be capitalized. Should the word "pass" be
capitalized to match the expected mfd: <Driver>: <Capitalized description>
format?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-spi-sprd-a=
di-exactlen-v2-0-13203b6aef7e@xiaopeng.com?part=3D1
