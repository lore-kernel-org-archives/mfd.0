Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5154763
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616731; cv=none; b=Xz6vygC1p1nMo7shNKkz9Rp5/w0u/W4d3eKoKOSmoyzvsdz5BaDEm4wc6eKMRVUXgNjeL5CoI6zU8XNQfdaJRQeGor6uTXTfI2LB2FauN7urZWjvFlR1LvP1E8No9oTIjaY9zOxPEa8IJJA3mnkcdYlYclzmQVyHNZxwTngCupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616731; c=relaxed/simple;
	bh=Raqr0byjzwnT5fh34EnqS1O1es0rzLzUb8Xi9knOW9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UFg0Mmw/BkwGYxVmsK9mIG59izEEu3fAi/401jLf/CQdDN1ezPwl5vH9cK8BXnq8xBz8aNZwjnw7FFmTMRXt/1i4gjZf2t8nNNK1GfrR43HBdCzrheCi6OZs68uPnA6raO1Y7a07pZL2vRl31AGBdE2WgVtXL9xCGgsOB8aekGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAVQJzgT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAVQJzgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018F61F000E9;
	Thu,  9 Jul 2026 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616730;
	bh=Raqr0byjzwnT5fh34EnqS1O1es0rzLzUb8Xi9knOW9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lAVQJzgTKVee7oUVnotMbVew+UJV9EUNFeGNnSubFYnphszPlV8lokbB1MTON3gWf
	 5dKUTfq9Emk4d5TVVp7jklOd/dwNwE+pqfG9yx4Dg4iec4R76kD5Qame01PRrytqRg
	 GwqfpIBkF7u7bygwngQ27Q2YA7L4mBtWgfQ/RJcpP1zYUIuYXynMRjjrGS4YQne5Vn
	 rmufdYSCwGqTOPn8h5GmJ3dF2fE1m1NagKxlFZ1ERjVAtqzo8789fUYb4CeZbBcepd
	 7fTrBxNYeCg4VGuU4rzv3IRivQIfrMuXo0Tp8wKOZpW62BtZL8Ls7OBTGgexRp0oZz
	 pPwVbyjmDEiFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <bd2ff9c736d422e2e93c5d2f07d570d3488799d7.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <bd2ff9c736d422e2e93c5d2f07d570d3488799d7.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:05:29 +0000
Message-Id: <20260709170530.018F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
> even if the driver is built-in. So mt6360_of_id[] is always used and the
> __maybe_unused marker serves no purpose and can be dropped.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D5

