Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05E3E49EB
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365724; cv=none; b=U9rBZBKJ2Z6l5DF3v83NqI+xYa1JbYr7F9DSHNqHc0A4WXUrbJitZImb03CKCvIHUrLpi5+VaLj6sazb2dSz+bBSrAWI8+QVaiZdSzYp+HJDtUIec57uVdSYqaj1W8GGa3XzyYFRqWu6Dk534bA/fiXj+3HwQ+O20iczvfGH3gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365724; c=relaxed/simple;
	bh=EhQThfDlEZkIrCINnRFjuQoPCxzQjSXs3c9OE/5V/hM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LcSUH4824fPgjwOSJOi+vPktzKe0+7vsGIUUU6nnuPgi75EZesthB3xQOBXAgzhZGE/TGUbAxhBhlpAkOVQOsBz9m0R3syQEq3KNQNKnaOH/kn/Oe+yw29Ttx84BLWyRkYQ/+47PlndZElA+j9eqjKUI2R3qzNQNoYbPHo09QB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFe1n7UY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFe1n7UY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E141F0089C;
	Wed,  7 Oct 2026 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365713;
	bh=EhQThfDlEZkIrCINnRFjuQoPCxzQjSXs3c9OE/5V/hM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFe1n7UYFJsEg7xojxbLCIs+w6mgg+O0lzKfC6q8QwWO93PX43uh8vNOK0Ky2iu7C
	 /5VCFuqgnd0imFAUrCz9HU8VDzTliuVslpf+hhJB0phJZ0AWj6K0BcYMd3ht18AkNm
	 A+YNLUNyt9c46j0UNAebVkQ4fiNRdqOv6e1UleHbk7xVYIbChE1jOmdLypy36DZFLo
	 mCyGUEK8pAULIpuWFm7va3jaourM6RyPShRuip6Dlu+inRAdJjbZE4SYuHOhGS4a59
	 euUhQYWKS7njFzqNk+doUvXpMwYHniz7f+wu9/VAUJa35k9yDSxCuWRz/So74DbtTb
	 GNc+BifxhXk+Q==
Message-ID: <sashiko-outbox-162800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/13] mfd: nct6694: Refactor USB-specific data into
 nct6694_usb_data
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007092102.3768818-8-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-8-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:35:12 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Separate the USB transport fields from the core nct6694 structure into
> a new nct6694_usb_data structure, which embeds struct nct6694 and is
> retrieved with container_of(). USB-only definitions are moved from the
> shared header into the USB driver.
>=20
> While at it, use consistent names for the USB device, the buffers and
> the core structure.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D7

