Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD439A075
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616927; cv=none; b=SzVReaOlo/BrvJCueAL+KXZIVqTllAw0sDbhCyKt1JsCFEb0NjWdTkVEfkzxiLWfCPvnse/APkLPAHNbY7ak08oQDg3dWFUpaPdvNI8OhgP7iK2P7+wpUxk3YYLeye6fIAyZnZkX3LheRoDrFFUBpho29eXKs7TDTp4+JNPn3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616927; c=relaxed/simple;
	bh=xFuHDs6qsN5B7zsIcleyZbhR96fACjLMAp6SsISqpjQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sPRJ0CHAhCaGjzR/SPYR3+rtNa3BPJ83WUkCzNUuAwpZcerrAybnY5dfwcnpg1e8YWGOLi9sreST/ojno5ssFJp6z7UWvehi1wWSvEnRuo11ACXsCFt5Lmx01GYNATHERjDz5bJHkmE7HXD+rPHyCzJdLZLmNu8IqjJarsEvjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQxaRYT2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQxaRYT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD1F1F00A3A;
	Thu,  9 Jul 2026 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616926;
	bh=xFuHDs6qsN5B7zsIcleyZbhR96fACjLMAp6SsISqpjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQxaRYT2yWE42kMBvnLTSlMuOR8SQ3b6M0jF305UiXpdx2nvx1+KIEV/Q1hyZdYak
	 Cje08ieWQPan/j7BwtmqJoplfvlvLY1v3vbwEwOMkmbing4agCvZDA8K4QXxc8HLq2
	 ZJtlEi/9igU7Yr4PzZB+K/9QSSNf/U/y8yO+qV85RIGyIfzwhpm5xeWF4y/IN9ikI6
	 +rWVNJiuW0oQOf3EErphrdkLWMJnAMiKAKR8DhX1ImUD2yBoos7ccz5sS79F41LKQC
	 k3JTF0M9ta84sWRKs6mcE6BXhl/AoOe6SJ/ZFs3y2RNqKskEkfvQ5pIkAqGluEMu7J
	 GdaKieNtvYVdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/23] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <5fdf1d0cc5a00e4a9aa68322bd2fca323b418dee.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <5fdf1d0cc5a00e4a9aa68322bd2fca323b418dee.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:08:45 +0000
Message-Id: <20260709170845.BDD1F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
>=20
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D1

