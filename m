Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537FC57C730;
	Wed, 23 Sep 2026 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201355; cv=none; b=FOOtgdcesi4IX3hE0whGgStnSRqufMXSQbIv0GT2wYPSRc+kLcQa21barhNuyIUIJYcV3jyZxi720ht3xkY5WRJzMBJUvwlq9McNrKR1qFiNOsg2RMB/nrWDbnO1Yv9d89DkqoV9UyqcWRU3eOYv/wzAPnRGYpOvcPV6fGDloMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201355; c=relaxed/simple;
	bh=0lPsF9cQGlsIaoextFyYiW90YmidRF6wpUOkBadi1DQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QbbQll8m9J6XHiO+eekMBqYKbmClCTxsUBW5eMxYDd5QA0McxrI/FojyJuttNwnfighoKGSM26pxv4iH/4Yvs3IJYN8oM/3UdhkzwzkzXX/LtA078bSO5AW/fhcuUkM5GzD4OcDt7H99SzQsxH6sO6bDt6CvRTMOkJLR8Y1QhPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu1Ub/p4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu1Ub/p4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18301F000FF;
	Wed, 23 Sep 2026 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790201354;
	bh=0lPsF9cQGlsIaoextFyYiW90YmidRF6wpUOkBadi1DQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nu1Ub/p4bzJJLQ3bF7v7kdZ1wjAilqCNuRhNaYEHTKRuQ32N1QKOkQWTbNxk5XIk+
	 juBPxaACe7kaic2tSSqFYfczVRqFIIWiRZQUlY+debykuvgJBRYH6vKUiTvjZLp6ei
	 KIEKkM4jb7XfKna7A73OaR5t8P/AElY0sNuDXeOYxS6LPRtH/uS3+8spAfBxkm460I
	 S6fQCvuGVcwFNXT8ll/2abCU4jIZ6pvw3DFwcm6wNZw5JF3uFUmJ3lW+VywNFLEHmY
	 nqNyd89FzggrTDpUABksUGzibXeFeMaBUOvuwQyDczWq2Yt2tNbJlELJlPJdUBj9vz
	 uxkYNknablQfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com>
References: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
 <20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 22:09:13 +0000
Message-Id: <20260923220913.A18301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
> Set additionalProperties true as this is shared schema.
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-ti-tps6586=
x-v4-0-6c7a8fb8b646@gmail.com?part=3D1

