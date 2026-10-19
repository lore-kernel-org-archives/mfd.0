Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F753D953D
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409294; cv=none; b=MLloPCQvIYmIb5dRqSuU5tXmQ3Cqgg3SpAGHVMhMl+vdtshPTaocULden++J+lKfo+cD2KIifn8YekQAQAC23KpwEsAmKMyOrFDNx4DyneUQ5htzN9QHxJEm3NUxcN2WqwlMzVKdzfWg0CZK5Pepmh5iwbfOPUKKwWwoiGdsGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409294; c=relaxed/simple;
	bh=LaYf+HfoF8J+ys6lk6WunFOYLLOz5Z56SGqzN6b+qQQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ah5A5kvUQXwwrrQVqDjDiXu68TzhoRep0g0pHTVZum0XrjqoIL5Qmj8A0HgykjNnOar5xbuNSUei+m4n4WX6NWMVlIX2L6hCWLjeIyTdJv8pb+MdmMyfV/nIVB0rOI79pN2foOHvhi5ZLC+wIONz3rgldoQIf1PVr30y6FPAK6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmPbLtXr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmPbLtXr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588631F000C4;
	Mon, 19 Oct 2026 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409289;
	bh=LaYf+HfoF8J+ys6lk6WunFOYLLOz5Z56SGqzN6b+qQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XmPbLtXrI2EqVn6viC2eFRx3U5WGSUhlbyNwbdUkS086v5ECViFxVye1lAf3AEtn/
	 633OY9sM+rM4VfCQNOMHDx6L0AADtacNS4ED+vJHOdlRhEgvfdSDvYeZC9tFN3xig4
	 HTnsO7kwtKoktN2M8EmZmVm+VslvZsbrSKnSk7hUAC+gR5KW9XHJv5gUvknfxL6FTQ
	 Th9P+DBH5heW8uKsgbUkbHCdUdLGykcKPZGQDHTWZoWzWB9ek/no2gkWKdxGSpnoRP
	 71Q/3N524cGMfFtUfPCZocE9y402oKDfP6H91HIeeJHUUVxTmxg68FpCBMSPTOXiSq
	 JSs4IkVVlr9NQ==
Message-ID: <sashiko-outbox-177036@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-3-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-3-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:28:08 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Allow the LCDB regulator block as a child of the SPMI PMIC node.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D3

