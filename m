Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123931F989
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 01:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386876; cv=none; b=ei91pYFd8ZdXv9nu9Czv8x8qOqzqja9DAXqP/AjortjPkRjvd7MZvvggE6TzTS0JX/Y/uQ3uZyUAuuUC9JP0q+O1Vu/35X+zDUmCjQoMNcQdWEZ2QnMxyl8duZ47FVqqTRnk8oaExBy8wfDefZ1jQTfhDz91/i6qPiXNDKYAggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386876; c=relaxed/simple;
	bh=EVHLENYUprVAQA2HPymFomCOnd2iUDXu8EHDBeFxLCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bAjmWC/WeIlBKX2cMdhye8pFGRAs+4nhZZo7gZvSQQr6FG247Uyd2/JKYgLvvDC6Y4TAnGdxHkFvE2xomasVi3aAqA9APWtC398q28vuJ1u7kMLjGZEWBRuUMpxZNtJMWJnCni3iAoIVVZ9eDT/0yHHQPVo+EFFQInYrpuPIk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvHBfHpJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvHBfHpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E091F000FF;
	Sat, 26 Sep 2026 01:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790386874;
	bh=EVHLENYUprVAQA2HPymFomCOnd2iUDXu8EHDBeFxLCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fvHBfHpJCbqySfLGA/1TZtob27PopgZLlTX16uvITddgE+74oJVwl7FIck6hVXSUE
	 kphrR51hgqsvbAPwRobS/WDzihKlMHMwNVM0Mwsh4Z1N8U72ShMBowwlI779QL+TlY
	 cMZhGMJD5m6Pt5un06ojELa6fnp9bcv/5+OW3Ho+ScIiQrZpqoDuefulZqjgTrDsh4
	 TVlrnVNDuqh939fICZylcTdSMjD/3EY47CyS7Rmpm8w9ulD7OxmR4AVq71fdVFAeSP
	 lRV5eONFLbsxq03X4M2/O8IIdQjyHlDCVk9zhfRqy0l+m01YHvWMiE2G+Z4c12bJof
	 f8ggcC1dUrsvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: twl-core: Allocate modules with twl_private
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260926013325.75073-1-rosenp@gmail.com>
References: <20260926013325.75073-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 01:41:13 +0000
Message-Id: <20260926014114.60E091F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Use a flexible array member to allocate the twl_client array together
> with struct twl_private. This removes a separate devm_kcalloc() and
> keeps the module data tied to the main private structure.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926013325.7507=
3-1-rosenp@gmail.com?part=3D1

