Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410B402BAB
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569842; cv=none; b=R6OfecFHnP82PEOg9bgQ00C4zNHCazhFIh6JxmVoSFjqmZKQyc9cp8Ua5xgKnV2cTFjLaSHJRUqpbe1XYmF00yzWm1IBQASUWF70ag+0i3X4SXH4gdPb06u57Mp0hnrSNDGTgznLluFdUjeghmRJ1SQmNkP9iDeKGMrVXNTYO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569842; c=relaxed/simple;
	bh=bbnqrIiY06AIq8WahCasweHZtMwmhSVwexrY8pNMuwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PUAr6yLRsjeD3x+1ph0Kp0RTV1xifegZowZ61kRChLbJfb/Id7ryYahDTZRFTPveV2ynSgHylH07L4pB5JCGCe67fexoiQOKmwjnzxb01C8IN040Tpgcf1JD/wERvJ6v9KtsPgFIVNifjyyH91OJycpOV2g0rf+pCaUxjsxw8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6O5rLyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6O5rLyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8FC1F000FF;
	Wed, 16 Sep 2026 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569840;
	bh=bbnqrIiY06AIq8WahCasweHZtMwmhSVwexrY8pNMuwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6O5rLyKKCNpqbRGIO0Wwxu/gRju5LdM94qBQjxqrpwe33vymCM+ckhIxV+xp6zTq
	 vS7WfLTYaSJwro46u4OI4VlrE+6P2FpyYvpLd/5eR1aw7/hIMOx+qrBb7r2qR1jeCU
	 lboUG01V+ho6tOtSeRobsOD850dwP6SSldkQBJCRowPJ2jVosNpSrdQ5TTEkm9W9pP
	 ha/gdJYgdE5swxZFOFEUichz7MeoBiUuAbBj84arBejCWXDWH8or8rXaI5cly9kU3s
	 hirPnAdrVZRSRaYyUFlpWfCo9OToLb6fD1m72P0AaHEYuFXma4Z74DOXwtCCcHfU8X
	 n7uFWzH2LwrrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260916-intel-lpss-debugfs-v6-2-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-2-5c118ac430ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:43:59 +0000
Message-Id: <20260916144400.5C8FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> S_IRUGO macro is obsoleted and not recommended to use,
> therefore replace it with plain octal values.
>=20
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v6-0-5c118ac430ed@gmail.com?part=3D2

