Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F263D5647;
	Fri, 18 Sep 2026 02:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698517; cv=none; b=U41VP/RWXWw9Spn81qQkX0z2W/rCFQGu990pXRHUW4mD5woc4L0YeqS0hDjYw4QbmFSLKpjlcXjwlEzt/Oq5DQa0IQ2QPM+K8w7kkJDHlpPBqi3fyzJq3bTK49Io543ODXibINJQArAB7fhXgXL9xPWU9Ta0aQmHIAu4UUEL0pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698517; c=relaxed/simple;
	bh=NAFAzV1YarVtuoygNz9ywCgFKdftHateRuPwz2tRYsY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fodck6Gi1Q8UqwDeQHwTtDZO4EKErrjplxa5bYv/mkZzDwKEmNdkaf1xJHrrDjg4SXl2ZWhxJQ0fzZaTk/d0HrgBMC8O0mxeAdz3TRSI570AkyaysHvhPVDu7k+9sCh5hdgLdAai5G8XG64O1z+hg5bnQ2PJnmnvT/RnLs+QeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcnYL6L5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcnYL6L5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141C01F000FF;
	Fri, 18 Sep 2026 02:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789698510;
	bh=NAFAzV1YarVtuoygNz9ywCgFKdftHateRuPwz2tRYsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EcnYL6L5YsJzsHyrgL7yJBoiO1VhFUjOEkBwXKtfVJzD5H7OdWHRdkVJfZh1FK8bz
	 1wAAyKXhAeNal0cPIkA5tUPkY/W3xGbJSS1W3gdZ2ZJgoH2omtfQt2LFexcHGjXGDm
	 B00JyJibXYTm42yOSe4EvldyQZzzFvPQKqqOEgj1PqQBiGdQFgY7SMijXB68+oIE1W
	 LuK9/PmN68FNcAKNBD52VncKpYnZU0K+4qF/wF0nzPD+ND8EDEplunpQkR0afGXT7z
	 ZGbyBs/51bnUUS2lStEmRIuZh1OZJTms+j9fCQzqjxUH2eVKNavdIP6nawfVPBF+Kd
	 yaKrvGnVc6/AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 02:28:29 +0000
Message-Id: <20260918022830.141C01F000FF@smtp.kernel.org>
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
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-rbrue-suez=
-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com?part=3D3

