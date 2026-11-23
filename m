Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456006;
	b=HvSnZJXxpAmH64H2JwSajzCNaDg7zAH/gJb27WXMN50fL5ss74wMTGP/vsgk6VPbAyQU
	 8QAyu2LnbxLk9N3oSo+T0s/i8N8xFBmvJJcfaU4d1/6gwlrnY/frN5s3jbg6uB0SazmY7
	 aKMZWHT9ooc6ZCrt6ogiTBRS4Rkta5XkaMLyhoKrL77nIBnM25nlG9PHEYosvEojWmlIq
	 d/sWk9IdD1onBXDfAlWSAKf3Le8/eewKomkIVMantr6RvmLDFhsHd9964c9n3xhIb/h5O
	 BvgCuGssgjTJOwGmOXLxsPdsvxcV46maPTavENU1BNRyjbAEI8/7GRcudmCFkoz+vNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456006;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rG1hetAhU2JRveAJJQmeUpedEEUd9nCD9P7MH5/bxrM=;
	b=IxRcCv2tfw3tP2IuICtFCFt1EF7NKwq5mnf8xZv0X4huBnkG7CoNAqaFGPlsjCa1AgI8
	 nv66r56Ksw03tLgVfT+2MXJwZEThFaWXHSHabwjGXdFz/J0Y7eyI8FMuekSAtlGEO0cGH
	 4+oGZ6wyLKWbqqFcYgIGqyYjMTvCd73w/VP8VQa3w9+d1HjMOdDcQEVTN6tpczTiWWHGn
	 2IHfsq/PI15R06hGnYmRKWnp0rYGWJ0obnFeBLNFaL2Xsn/n6ZHRllXwSswnAWeGRYJf3
	 I+lS+Tp4yatQk7v7mHhod9/5ky6opMnCQ1+UF4v30LTRsLC1axIO72tuCU18ecoi1NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ei3W9u7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621E4606A31E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ei3W9u7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6801F000C0;
	Mon, 23 Nov 2026 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456005;
	bh=rG1hetAhU2JRveAJJQmeUpedEEUd9nCD9P7MH5/bxrM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ei3W9u7vS11u6U7ULg6V9uPkePXugUc7ui+Ahg+U6atdSE+1gHr0cPkRMmlTeIKJz
	 RQneP5HxBbQlt83UlDpW2RQzZYxoKG1D64ro05akslyA5VUkLG33DsONxhVySKDSOt
	 tuvI2aKiQ6l7Vr15p0bUWtZYwvkJlxHYdjf4nfnbuFg7IqrXz5D9zKhAZPnX3eYaB/
	 polTVKlQn9kEWHiN2bDDNSLHaDhXG4ekkJURKsGDF4zoTie8YXdaeR0PRLeCiGpIEY
	 QCboCfETt0urrBMDj/yAoICLzn8p0MXOpcClp9fopRZbRMDT71yw+hXOCXLZnpFePf
	 IJnFOjSkHdcoQ==
Message-ID: <sashiko-outbox-229779@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: max77759: set zero DMA mask
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123-max77759-dma-mask-v1-1-6f5c8d52904f@linaro.org>
References: <20261123-max77759-dma-mask-v1-1-6f5c8d52904f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:46:44 +0000
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
- [Low] mfd: max77759: commit subject description after prefix is not
  capitalized
--

commit 6bf2915187b9885f45b11bf0e1a482a9ff23cdf6
Author: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

mfd: max77759: set zero DMA mask

This commit clears coherent_dma_mask and points dma_mask at it on the parent
MAX77759 I2C client device before registering MFD child devices so that they
inherit a non-NULL zero DMA mask.

> mfd: max77759: set zero DMA mask

[Severity: Low]
This isn't a bug, but MFD commit subjects capitalize the description after
the prefix ("mfd: max77759: Set zero DMA mask").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-max77759-d=
ma-mask-v1-1-6f5c8d52904f@linaro.org?part=3D1
