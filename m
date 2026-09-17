Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1153BBFB4
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622736; cv=none; b=pwdszqWLsGy4uqLd3mABZ2Y7y9jvpoEGN5kylllMVZe2VunaLkz6mHIE273OVqGjSG8EH/9aYeEXIjWLRB+7NoyzZzAqYvwdACpfd3i5vRG1DlRcAr/Uc7aUe6oPiZ1kyWXMpAD/7rgCRNOct9n+txb3pERxa1CzJv7pMRsOQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622736; c=relaxed/simple;
	bh=vKkpnuD/JAKpqkgdAbLZhxKbLmsv5IDTKTFpBHoHf/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DdAn5EI/Ax7zVIDenzqCGPaVADFy8hA5fo9YooM/STwhJEytc9ypTCLY3RS72ojJDFpvVipG46K7PMjhVaHSpRFBKkA08tyOMZNMNK7DIlA4FE+O8fqgxVdAmJbxqgT+slF3L+ikzQq/logTiLP/fgH9fO4jndUsVFodRuCPizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEjy+e50; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEjy+e50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7581F000FF;
	Thu, 17 Sep 2026 05:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789622735;
	bh=vKkpnuD/JAKpqkgdAbLZhxKbLmsv5IDTKTFpBHoHf/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FEjy+e50dX8xyr4WDwKXkE+pP2X47UfdRJNkXMMMwH39AuGWyJZIpSbUS5i9UojZC
	 7sb/QTDk/C8USsAv4FDVB7iWFQOjNfY1MOPYf3XmV13jlIVCAX/DcaqazdbMvip0oz
	 9n7CC8oKI3sS7TzrkKGlvg4rhfTisdPZYN2mAHlzXr47dmGUQHxyZobdQ3s1HDRFC8
	 HryHFP5dNwAvgLvzIc4bbi/vRjQCjRxe6fjr2C2s2RflQ3kmEbxKxtJ9YsqdgwasJD
	 LANKT/2QGkJxILWqbLGd8lqL9hCu3G89AgwBz5XBuO7pa7tEGbZl0qYKRDbATlrp6L
	 dAKpMnpI66YWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mfd: Fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260917052335.13288-1-hemanth.selam@gmail.com>
References: <20260917052335.13288-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 05:25:34 +0000
Message-Id: <20260917052535.1C7581F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Since v1 this also corrects "wainting" and "comapletion" in
> include/linux/mfd/si476x-core.h, which checkpatch did not flag; Matti
> Vaittinen asked for "wainting" and "comapletion" is on the same line.
> The subject is also capitalised to match the MFD convention.
>=20
> v4 drops the two Acked-by tags that v3 added, as requested, keeping
> only Matti's Reviewed-by, and drops the Assisted-by trailer. The diff
> is unchanged from v2.
>=20
> Only touches comments, no code changes.
>=20
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917052335.1328=
8-1-hemanth.selam@gmail.com?part=3D1

