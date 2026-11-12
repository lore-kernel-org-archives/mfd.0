Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494208;
	b=tzyLMgadEd0fMT9hyalGp+RmYfsnt/dAqY8fcICLqX+m2NYOFX5Y6jYgeUz5tJ5EuMZS
	 /+fe9C86SfRbXdb8DZ53HIcWG0p16nsaH1zfBzcTO1tTNvbqFvAjQxDAzKinYMIrsztlj
	 sl549e4xLzMOqpBUKpxTSJ8g7Sc9F99Q8NqgKxCa+WcBYVOVgO291532OVQYazeg0gCpg
	 vaTE2boCBWtbvmzxoEt/eV+sytcemZrF9nFba2VMXCjsXhg3e6O+aInL75HE/OuGfRr9f
	 NJLGMoQI898Z46T2DpE81qiHvTQltm3hjjYzODriOee/QlOj2eVtlcBVVgYb9ewSM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494208;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AD1asTJ3MYD/7UAu197yBvtyRRP43t/TY6lYCLPO5UY=;
	b=rAnKrNn5avIvM2rU3LV/O7uWNOzLuuJ49XPluJMII0rWUmqk6Olp4m20n4bYvLCnbH7A
	 I6AwIDtl4k4tLjPqhMZyZ0oZ1C614IViukdle69qtUdc8w1iE78tv0ONAAy/bLL+PXtK0
	 Y+bMgEL44IpiwK56Aw25Bkp6BwEsLUNZvL3zUceJcpd5661X53pz4w89IgdJAEGZ8FFYk
	 hXuYSgS0PL/5wZsrsN25l0PsJRdGaqQKng8HFsizYxw3T1vPtXaZluP4CQcdrwXK57lzs
	 BMfabDcjOJ0yqCVITJ7mw5LglSGX4QTuuX6UB4wvzQ5m9sBlBCr4Ou0FkkMX4V6H4uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6jU25uv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF28606B2CE
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6jU25uv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8281F00A07;
	Thu, 12 Nov 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494208;
	bh=AD1asTJ3MYD/7UAu197yBvtyRRP43t/TY6lYCLPO5UY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6jU25uvtHXAbcpAs4xUGSVrXFCXtBrS9YKaoJTJWmV8dm7PAI2wOgUk5R58/u71/
	 OYLTpeDjscZkwH4keD+wLk0lhyVUOJZSjy7IeweNgj1Qdas2TuGdCoT4ZRPsjB8L7V
	 nVh7AST3A//occNfNdM0TbBW4AF7zAWasOkgpw+j0UO8YibBZ0wynzUMi8ZbGE2JgY
	 aycO7/nrQOAcX2P6MdJoNaBnCz+FiBDIeK5Z3UWffIK5EXw/0UUPDd8fzUuqoMVKBj
	 31aqM2WFmQMMor9qSpOoWGdlKpoTNZZbf39XnkrrjXc5j6rS13JpWrB8bfeTlhFuvm
	 kKvfdZQFF0tow==
Message-ID: <sashiko-outbox-211350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: cs42l43: Update load detect procedure for
 cs42l43b
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112141650.1931348-3-ckeepax@opensource.cirrus.com>
References: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
 <20261112141650.1931348-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:36:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The newer variants requires a slightly different process for the load
> detection. It is no longer necessary to apply different tuning for 3 vs
> 4-pole headsets, but a new field does require updated for CTIA vs OMTP
> headsets. Update the driver to follow the correct process for this
> new version of the chip.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112141650.1931=
348-1-ckeepax@opensource.cirrus.com?part=3D2

