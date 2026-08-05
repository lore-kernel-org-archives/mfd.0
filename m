Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABD456E02
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931882; cv=none; b=PB/dL6+p4N0hL1yIU6pNOieAxB1+06ierhcZPK8L5oKuFd5HqpTzKy/m7r6C03glhglZD36545mIkjJPze50aS5qbRnaJrmhrm8n5CZ+XC3Uzeg9QgK9yLIC7AAhhKuCdHqTakavmIc3VV0gec8eJ8hqHLg2BQaXbM0YEuCi/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931882; c=relaxed/simple;
	bh=Jc7KVNPqz4uFPFSoarQmz3atbq+pMH8cKsgoJ9aR23o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PdGUhrhgZTxvKwvNse9GO7A3I1OKQdIhKyS5dHTRsvQsNlNiNDvSWXhsRQIifhca/GZOfOOMs+sNSrdM/78W2Vf1ZWyX7ZOaQC6PUJBJ514P3X8s+msuziOmiNgssYUEbiUeQSe6RyEK9y5JjW7Ql22adYbWynJBhlxVZD85RmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBJ2SaHV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBJ2SaHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D84B1F000E9;
	Wed,  5 Aug 2026 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785931881;
	bh=Jc7KVNPqz4uFPFSoarQmz3atbq+pMH8cKsgoJ9aR23o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OBJ2SaHVL1739ymjDDAl71tsirlT4+PF/FFVuXK4QKMGOBs/qyWF8t/WOsKpfH5UV
	 PmEi5HnBV2dryI5muvHrs10LMqBSTbrLrDrsvm8IGt8Bi/eh8yiR410fr9sm02qiTu
	 XVA3ZAxZL2lMdmkQD5gsbCHLp570bjuuolRDLvXh2M+TlVo3b4xlii5aM/Yk2Jx/0F
	 W+tGrEZH6AQpGWK6sGrKYIAwHILhQUoLDHUfXrIVGLrc+NcB/vhWnxSBzEtj7P0hAp
	 DP6xDE0NyTS52FR804/1wHtHGq92RgH8/6ni5mOybWHVr7XWsBDfZcgp4bB5dqRGH3
	 RgMd+vdxq0mAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cs42l43: Fix regmap defaults ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260805120109.4024451-1-ckeepax@opensource.cirrus.com>
References: <20260805120109.4024451-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:11:20 +0000
Message-Id: <20260805121121.4D84B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The regmap defaults should be ordered as binary search is done on the
> array. A few registers were added in the wrong places, move these to be
> in register address order.
>=20
> Fixes: a6fe20d67dc7 ("mfd: cs42l43: Add support for the B variant")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805120109.4024=
451-1-ckeepax@opensource.cirrus.com?part=3D1

