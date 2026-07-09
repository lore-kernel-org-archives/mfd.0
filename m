Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1739A075
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616792; cv=none; b=XqqbPWUDfXZHLGJTualKYVv1bOVYyFJ3vu8ysGL9LqV8H4kfN7YJacQXvltr7HzzJ/brxqX6f7CyO1VSB/0p7jln+LwAD5fpQl4Kjmhw/pO9dVWgzJP+8rv9bBKt+9KQ9qy+dCgdTZAIRqAE1tJiUiVVizEqX2uO0eX3Hmi9/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616792; c=relaxed/simple;
	bh=9wxQWz3sUKravrF7NjMRBuxzZbZ5XIKtvuTrh4QiZp0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kp+fMheVn/pR5imvDqadtBASFIlhaNZKR9yxu+cSuCSqYoIH19gC3BRs9c/+WYm6CaEHP4n0DD7dt9KaTV6nUS3TVNUsvhioqwwSZXEXsPEY0you8pcI4AcIlsvr2jWo/l9k+2PDjtL5ixznyJN8oq3MVYY2ly+at36pmG4cMpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwhY72pN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwhY72pN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF2F1F000E9;
	Thu,  9 Jul 2026 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616791;
	bh=9wxQWz3sUKravrF7NjMRBuxzZbZ5XIKtvuTrh4QiZp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LwhY72pNTCjQ68otzFmCpSyP5DVIazpph3wuPzOVU2OvXG3b/NFqaI14fbG+ETwfp
	 +/dpOkNW7vUrQvGQG8KuTAagBQfc91vYxJqPjIdgA4hCCgO8j+D7S6ojbf16jdq0NP
	 LiBjeIJp5LG097icGgmmiXQlDRzh7Cy+SQh/WugTKX8tJXTqn0gh32vxKKi3Bzzzoo
	 gRCXL5A8pEzS+Bwcpv2VTzYU7GJLifbhH6A4e4KEYm/BLWT/Z4JIm5Z6dMGHgACLme
	 612kH7Pq0ujONrMaaJpV/oS1+sByagTxBuW3+YeHcTbQgyGi4HLr9JEJkjjXKhyy9J
	 obS15mc2Tb4JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/23] mfd: rt4831: Drop irrelevant __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <721f349322e9316c81763cc1940dcbeebb6f0241.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <721f349322e9316c81763cc1940dcbeebb6f0241.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:06:30 +0000
Message-Id: <20260709170631.4FF2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
> even if the driver is built-in. So rt4831_of_match[] is always used and t=
he
> __maybe_unused marker serves no purpose and can be dropped.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D6

