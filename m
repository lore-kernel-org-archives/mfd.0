Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851671;
	b=TqHTCO5e9MyTxQmk8E2jXXX2Q2A3zHtbd5ymf7rc2Lrq2N/jMZvwAh8JOEC62gEKcPEf
	 0JVM4p2S1GIWo9xeJBsI14vFpd5c30cgeC4ScUKcLxflBPCPOQViP/SEkFMCIEfm67nby
	 Qmm7Jm3WHASvmRXGMC2V1Tk2uyUiD7/tWpPLFlHETFGaxSPPfKUlq3z9okNrC1lAZ/oA9
	 EG5HhTsv1MAypb5DSgYJPuRlpCDnPjga9Pupt8njDxYfxuqTKZcQgTzNp9xQoJ02xAeNd
	 3sy4FStkDAEOe0Wd5BijLncVnNjYEYjEK0OKfc1Kuji6eL2ySri/NjgRzwqmoM/gwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851671;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IB3dM9ENcSdR9Mr56rlLqk0cKHWj3c9r/E0uhKyKXa8=;
	b=3sUbT+wd/Nol3OCqS/VqHeKgxAT5IiZtgauoK5LizkdSKmVaQGctKeagkwaagCYnzU/D
	 GvDcONFLomFvj8TBPqXgJM0hT1H04sq7U94KKn3sEn5ZCYqqVIzg6XfenQWXox+t//YdU
	 XOeaYemVdpxBkgA0XJWgVZypD+FIyGCmSWBDNOgvEEganQMOr5J+9Aw9b8QWNY9Z/4RS7
	 Rf2wcG6QCvU9Iktwl0ilmu3dW7rALbLm/CU4L0kV9vnXeDosB06mviDyIDk/BmQDKiKvI
	 8IaI62a5i39qgOz3d0YssymwiWZsfONhWjT3AlRvpHTlFErhJnVV5z28RFOQ748cx2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9KC4hwE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F527606A33E
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9KC4hwE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AB91F000CA;
	Mon, 16 Nov 2026 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851671;
	bh=IB3dM9ENcSdR9Mr56rlLqk0cKHWj3c9r/E0uhKyKXa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9KC4hwEN16l2dfyidwFTrWOh6y+CTvkdFM1WelLe2dh86YSVhV6JLKKWjY+ekkQP
	 CRK3lQa0vofc3KRN17DhCD3WrBGYjGaTejjEEh/Fcr3HlC4ITwA4n2ert15WsEdrDD
	 DCRQHxE6ftSTKJyrKZRc25eKBEmsKFJ0bXfYfJDZJZkiZkWnyMfBaLl9Br8uTkVTHb
	 FVXLCv5FAOPvnnmlBIAuPgwu+N4POjUOCTC/BcUoRw+VAD1vPWbDFsldUCGeTkb330
	 0q+J+dVtCnUg9rIGBnTw+DWMs1VPA4meILfyJzxRsETI4vdnkgt3sdzVdBt+1zxqK1
	 x7bNsAbaZ7nlQ==
Message-ID: <sashiko-outbox-217456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] pinctrl: airoha: add per pin mode field mux
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-3-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-3-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:54:30 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Newer Airoha SoCs select the function of a pin through a mode field in
> a dedicated IOMUX block instead of through function specific bits in
> the chip SCU. The AN7589 has a 4 bit field per pin, eight pins per 32
> bit register. A group can then need one register write per pin, and
> the two entry regmap[] of a function group cannot carry that.
>=20
> Let a function group supply a pin_modes[] array, parallel to the pins
> of the group. When it is set, set_mux writes each mode into the IOMUX
> regmap and then applies the regmap[] entries of the group, so a group
> can combine its pin modes with a register write in the GPIO block.
>=20
> A SoC with an IOMUX describes it in its match data with struct
> airoha_pinctrl_iomux, which holds the width of the mode field. Probe
> then takes the regmap from the airoha,iomux phandle.
>=20
> No functional change for the existing SoCs.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D2

