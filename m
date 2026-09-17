Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BDB25B082
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623807; cv=none; b=c3locQqF9rdMKh+4u1sEkD9Z8O932CEkrVBPsjQkgjzpEE/09I7KXDEqEeVCunTkU/3fKizrc+MiUpcDyYU698E5yrNX1JSYIkSyakjN0QiZ2+OzbH/GZrLVGy6g0N+vGy6B4nhuFh+AqpkISXRKcJNWyBPkQ7hJbXtd2CYf8OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623807; c=relaxed/simple;
	bh=XswI8dxiw9WI5tC+he5B6G5b9htw5lDXYGWjpcI9FJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P99U1XMjXW+TksdkodCs0W4h9Ks1Yt8U3P2KtJX2WmAH2tVENNS7kUtc+K53uuNQjqG37Y/FAz43c57qmk6r4Z5c1b0nTV0bLFLbx4sQxAKrF/XDpYu/ESF1ZDRapyn1B7AI4wBIc79gbHL0whey1P0zYgqWCIv0aHjEUgnNMw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXHyuilP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXHyuilP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A812F1F000FF;
	Thu, 17 Sep 2026 05:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789623805;
	bh=XswI8dxiw9WI5tC+he5B6G5b9htw5lDXYGWjpcI9FJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fXHyuilPRc+Gwv7TAct2gJQs/6qY1Xi46Wsi6reTEq12Nj2AhRLJM2y+fRLyQAppa
	 cb4Ukwh77inyOa7Bn/6Qb2gmXCd73LXshIy2dVp0mtdvOutb5XM10mOJ3OGDJgoCLR
	 fSX2ZP+KTZvczG00lQLQJBlL8vilzkd2xXW8yFclzxRqEAA50ktchr9pAlTf9bOpFq
	 vKSnV4T1NpPHCl+G0NAL7M4BvqWw6pgBQP4L0C8XUloSTKmL7EBY3U+s5vybyrB/i+
	 dMtH5JOQ/J1YxKyjNqLDkkpacrSSfAbob6qmOJbecSZWdjCBfXGqBX9uOjKuvF3Ydg
	 BYJpqKO3aiKPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] mfd: Fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260917054045.15805-1-hemanth.selam@gmail.com>
References: <20260917054045.15805-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 05:43:25 +0000
Message-Id: <20260917054325.A812F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Only touches comments, no code changes.
>=20
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917054045.1580=
5-1-hemanth.selam@gmail.com?part=3D1

