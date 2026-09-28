Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAEA36F909;
	Mon, 28 Sep 2026 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629267; cv=none; b=oe6H2T8J6xot2OfX5xTKO1v5w9uv0N7wKrhKJSWGVYvHuQTPfpLc/xzgHDc70rAe4kwEKhmIyCWiM4sqkWn7tMjFU30Ra3kFTwWterVvCoBZYGXZ2omwnlPn0WJp2mNdxacz+sbv3LSiAezYoSDPhjMfxIiWW0dIi03BbhCpm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629267; c=relaxed/simple;
	bh=Skj5EV5c6mEDFGFmLsGF1oEF3RUt2aQF2lX/TbVDAMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JQe7sQcwlPnwWZbjMfqhwxcLik13bO2FvVIhSHaHJPQGccaUFJWhX9gogF0vwkzug8epeVtxXTnLwyRPbVSqSPipKkkeczVFsdtT4f+TWzEiPt+x0U5HahwPqI28WUoF4t+7CaWzG+t0aRWS/oRP036NdEx0O9hruJFYskofvPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRfbbHmj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRfbbHmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B97E1F000FF;
	Mon, 28 Sep 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629265;
	bh=Skj5EV5c6mEDFGFmLsGF1oEF3RUt2aQF2lX/TbVDAMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRfbbHmjtFThKPa2uAwJah0eY80YNnov+SUUs5KkqYxYsGAk8klmvdTBFdxIoUAqi
	 O+TCItyz6YKQNmDuvcpkKJ7dwVUgJxsazGMKLyQgWtzufmRQgokPPgiIaUKYjHTY97
	 /kITZxxjZkPsOyYufA8FkYK2A37GxCqMvOXWDK4Nw/9uS6ThMxMGttAllhcKAXmcs0
	 /t6+2rYs667LD8d3ZAFckA7TzS4WBxpRUCUoky9BZEzMwfKIc+MkFPokbHAewxSdC2
	 VDhJWVOUPiymPblMsyxDBsuewQ++qQPaj6OMfolfLPZNtv7SQR7YyydmYLBGLQ3Xr6
	 HWt/u0UIr9uZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
 <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 21:01:04 +0000
Message-Id: <20260928210105.2B97E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.
>=20
> Assisted-by: LLM
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rbrue-suez=
-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com?part=3D3

