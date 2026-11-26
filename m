Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674412;
	b=MZ/7kLJk77J9BfuPU7/dotOz+S/j2BAK1Cox7exYAzflWgxMLBnlsh+9eVR2yCxSUJ2l
	 QurhTl8FqDALOWuufa5Htkg0xzupS2YWWmCPE+NTebcvVZVOfQEVYX3SgqTIASdc8DTZ5
	 U8Ctt3+9cr6KH7GuLEOr3F9YMHesJhuCOhGNb+e2ctMdrpXsZtHt8PeD/110XAx2kO57x
	 gsI869OSAthwCHXCYfecJRJ5cbODKhT9WPSdonu7H6gZPtHJl7rOQOCaj7Vg9S95Ad1n8
	 8hVMkUlP7ctC5CoegX0P29gbwY2n2chiQ7aQcXn3x9dm+C/h9n6bEJ5y45S+tW9IHlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8IWtsI419QxJXt5JjYvpNs+RQvxkcPsfA7fwWDluKZA=;
	b=Q57NL+l4AFqtcSN1ty7PczRQaGa6CojLUHD7EzBnELQL6YhM7j2WuD+Z2W7FsHOKwPnh
	 sqOBnQ6xMXRQMZuMSYPTpL+cjUg1G1mLAyWHO5s8AYiqibi8hpferMXijhO1/A6+WypZ0
	 6ZXxI5hNdlaeJGN+ChOvM6c+Kvw3FL9I6e1pgd2d7GoyyCSCiNQsb4F9aV1UCjeTPPgnS
	 xgfun+FsIhncCvHP0gR7j3Rk46K+IAM6XxN0oHX8t+1N96t8y9vRBuIxIaPVILFGwqpYn
	 /ddqkB5CDg+H1s0nmVH0E6SKqtPy14t3LnVcrfTWGbZtcU3Gf4gQaI5a0LSanP8R/NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Is8ZK5V1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFF606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 06:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Is8ZK5V1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8EA1F000C4;
	Thu, 26 Nov 2026 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795674411;
	bh=8IWtsI419QxJXt5JjYvpNs+RQvxkcPsfA7fwWDluKZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Is8ZK5V1ZgMCXmbiIcZuN9JnAz5pZgyzz2rOl9zsnreC6oUkb+ojaRMACWQYHORPQ
	 psSJJCytGQE4hfyoQZSRkuIek1WrTgdmhI0vDFqHly1o+Zh+dskJyJ5kxca9WItXZP
	 ia9SyyVb3kk1qIzgxwjEraj1cTFHWT393vyiCU53ypLSpVfFsacahU5RCVLlNkVLGp
	 AG/CUaUVbqVvvQ30wgoNSlPVpae8HFdzNpPlXFyK1ovv2Au7uJW6UWA6XBxlA2kSuB
	 f+44bLrnXi0Vwvw6bEXmlFuSiUy1OnpgRXXGInM5W9m7zzXIUdvFx+uEkTL6DcgnWT
	 DElaLgptOnJRg==
Message-ID: <sashiko-outbox-234842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: rz-mtu3: Fix MTU5 timer start register offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nhat Tran" <nhat.tranminhk2@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261126062307.53943-1-nhat.tranminhk2@gmail.com>
References: <20261126062307.53943-1-nhat.tranminhk2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:26:51 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> rz_mtu3_get_tstr_offset() returns RZ_MTU3_TSTR for MTU5, which is the
> index of TSTR in rz_mtu3_8bit_ch_reg_offs[], not a register offset.
> rz_mtu3_start_stop_ch() and rz_mtu3_is_enabled() pass the result to the
> shared register helpers, which add it to the MMIO base directly. For
> MTU5 they therefore access offset 0x002, which is TMDR1 of MTU3, instead
> of TSTR at offset 0xab4.
>=20
> Reproduced on RZ/G2L SMARC with MTU3 in PWM mode 1 on MTIOC3A and a
> temporary debugfs hook calling rz_mtu3_enable()/rz_mtu3_disable() on
> MTU5:
>=20
>                           TMDR1 (MTU3)   TSTR (MTU5)
>   initial                     0x02           0x00
>   MTU5 start, before fix      0x06           0x00
>   MTU5 start, after fix       0x02           0x04
>=20
> Before the fix, starting MTU5 switches MTU3 out of PWM mode 1 while
> MTU5 itself never starts, and rz_mtu3_is_enabled() still reports MTU5
> as running.
>=20
> Look up the real offset in rz_mtu3_8bit_ch_reg_offs[].
>=20
> No in-tree user starts or stops MTU5 today.
>=20
> Fixes: 654c293e1687 ("mfd: Add Renesas RZ/G2L MTU3a core driver")
> Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126062307.5394=
3-1-nhat.tranminhk2@gmail.com?part=3D1
