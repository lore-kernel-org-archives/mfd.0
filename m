Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57336C0D6
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245974; cv=none; b=cN4o/SuG5nkZ8CUlj4CmqbSD2/+a3vCKkgWSHNlbESubqI+S8isKrWlQ05+BE7Ue6te9gfWmgdMJRsDPI8OjAMH5bUb+bAeb1xxCcnV1qDO6SVUrM7bKXfLZmV9vuFEjo9csynEfLfTQf2YzCVHfeUjSJoSc4j8mhJEnHHxKCCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245974; c=relaxed/simple;
	bh=ijjybpOuYrCIGVnvTepZxENGvBEPp5umWh8OKG6ruNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jnnd6VaU9IOn9FDt5GwJrxSoLCBwGt4RYm9AWk1JVXGK6qPBqH+HdPz4KCGCigEVcsDfUmsxzKOnpMN2WuScmutXekouA9ZQ10xMU01Unvp/xXypAbcsHeSWEx9XiEN5ieEZ9or9zIE0hmspRALOTblAj3/y5TULAdOIm1wwkgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmrO/Zxp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmrO/Zxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BC41F000FF;
	Thu, 24 Sep 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790245973;
	bh=ijjybpOuYrCIGVnvTepZxENGvBEPp5umWh8OKG6ruNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZmrO/Zxpvb31JEetAhuG/K81WQkV00efakxMoYj4O7N2bza9/5uYU2wNgD1LQ8jaM
	 SiFWUp0bmMJhEzLJLIK1mXa1GJ82U/roNztvE8Ob645yzUTTHpZvFjvXqt6DoqJF0F
	 gwzlTBZaJfhvj7uOOSA7JY/iPjOBTSJvdvYOMvY32nx9NH934M1iN48jC6fY6dAUXZ
	 a4Pyjp/ejkngYjColyKeoZ2IOs67XNP4m9Ery8QscxCOEX2X8ESB30tQr4oF5BUO2O
	 Ue1O8nBlOUHUySDGE4SfXWXdg0Qvr5L4mCy4us87FZucSQcXOGW1lixkEEzCtihn/Z
	 XktBp/RaLpqsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] mfd: Fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260924103046.1709181-1-hemanth.selam@gmail.com>
References: <20260924103046.1709181-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 10:32:52 +0000
Message-Id: <20260924103252.B4BC41F000FF@smtp.kernel.org>
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
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924103046.1709=
181-1-hemanth.selam@gmail.com?part=3D1

