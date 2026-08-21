Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD725F7B9
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283634; cv=none; b=TyC4hKoOpZ4spHXprfbsx8f7ReI8+eA8LMZV+3MZRt0GGfUy9hRiv0RJWHLFlntnkmmrPLLHdm3k/TZqvj2ztsQ7j9gaT0qq0qRrerwzNtx8YdLQmBCeDQyo+Ju7oPxksMOCU/dWhi1BrsZr+Tw0CnA7HunYh/Y9PVrnXJ7QdQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283634; c=relaxed/simple;
	bh=jlSVzZhBIF3B8q/e/gdWYouwJh7JTFkDwEpXkUeClpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WfsWsQOF9YqrWKCoQF8+fLQVGaLeVoCKNEaTsBBGfBsDVgSrRqn15I68NTJxOnWlu16KeCj6+BBfv0+X8tDlqqk19Osx+S/Sd0YUP2sstY+N5MpcIkm/H6oIR04Aww5ULKWAT4tA93vLqH7lRII9hD29ynCKkDoUAqQ1RyjrZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqijnrVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqijnrVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9091F000E9;
	Fri, 21 Aug 2026 03:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787283632;
	bh=jlSVzZhBIF3B8q/e/gdWYouwJh7JTFkDwEpXkUeClpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JqijnrViU0BRqh8GtCG39trBqT2IZnlxQDeG62ukdBizpUtQghAyOSZMuj1QDiZTy
	 HNuR+46/FoXjyKjx8BFsiwRGy+vYxYcD88/9akjV0F8IsxaEaIzsJV2m1ojKjWHFVz
	 X7hIdpde0N2iyLAi5Qp69oiG1ECBYLx5PM3FA36F2N3zDdGVwXDtsWDwHqogaHxnWw
	 hMWIw2l0lRAvRK2Dp5WKdwg62qzJIL8wIqBktCdBpiXa24OB/pfcR9qJKye815AdhS
	 LlHigyCx1J76zfmjilzE/NGyUTvmjarip4RF+RXvKdgvINBOB4QBwIVg85zeQuEIrj
	 RtmDufzCZU0Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/10] mfd: nct6694: Rename USB transport functions
 with _usb_ prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821033505.4017901-4-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-4-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:40:31 +0000
Message-Id: <20260821034031.EE9091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Rename nct6694_{read,write,err_handling}_msg() to carry an `_usb_`
> prefix, marking them as USB transport-specific. This prepares for
> the core layer and HIF (eSPI) transport added in later patches.
>=20
> Add transitional static inline wrappers nct6694_{read,write}_msg()
> in the shared header so sub-device drivers remain untouched in
> this commit; they will be replaced by the transport dispatch layer
> in a subsequent patch.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D3

