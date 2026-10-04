Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BCC473C84
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136009; cv=none; b=W8cewdgnfuPsZ0RYmn9F2arbZy9+pOL7xtNmg0kk0wbkEYV2MlzPEhAvskl6zSG7/5lKHifGjRqPWhd20LE8uYU27/Fh6eu1mkzHwQ7AG6o+A/UhmDsBaencc60lYk0AHpoJnuoRHg0v8f8Ey7GRSKIzKjv/JYZI+DnbtjbQyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136009; c=relaxed/simple;
	bh=HXJHnF0q4RmPK3FjSlKta5UZCZCSVM6fjXtudijD6Vo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X8vjbwas1PunXLEXJvTfCbYetTKQt471d4EifQAzytY5zL9Hzd7X5sqqtLShU0iTgVUUxEYUE9GBHqYgksa8Np4NoSzLywQkU+gmfwG9eNc+cr4P7Tcj3VuqXRS9as4llMwEoZK8OMMRGLTVjzXtDfKKUyp92l8CPhldh6I9vG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jemy56JB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jemy56JB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61C71F000FF;
	Sun,  4 Oct 2026 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791136003;
	bh=HXJHnF0q4RmPK3FjSlKta5UZCZCSVM6fjXtudijD6Vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jemy56JBuFHkusulGc2ffW20Cvg1iVcrw4b3P1hpmW09Xd+OZZTktfUI2fl2AtXT9
	 UVul8ZVe7rFvuVvrh1ITOzIeOz8JjIBnjQpB4A+s4hGq5WD9ZyliPEL0DnE0IrfdDS
	 WZivT/knEOUSXMJHLYKogTR9Suhpt41LzC+nghmSI8V/0JF50/Bpq82K60wYwbD3yU
	 1BDdzl09YTkiCTm5VcZzfViVSTRDuT9IDrLlcflwUo7s0x+7OMpU0Td1sqm7ZKryoE
	 58xO63iaYfFZ+KFCDgFXTtjVUdAkqWsexT8n3g1FcfFRdQRvEdZ0KqmlEF+xB7bcPY
	 5mKOKBjzSdFnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mfd: rz-mtu3: Reuse shared_reg_update_bit() in
 start_stop_ch()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261004174024.502949-3-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20261004174024.502949-3-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 17:46:42 +0000
Message-Id: <20261004174642.B61C71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> rz_mtu3_start_stop_ch() performs the same shared register update
> sequence already implemented by rz_mtu3_shared_reg_update_bit().
>=20
> Reuse the helper instead of open-coding the read-modify-write sequence.
>=20
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004174024.5029=
49-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D2

