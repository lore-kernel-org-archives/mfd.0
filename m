Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1565B67E
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756952; cv=none; b=qyXslAOLcpkksIL2d/DgMW2ao9eAIwfSwME/AswcB7mHKzC+SQ87tq44mQXFoj/OlJcWLb3MVkIGh/XDs6qS2+86VEplS4dz9u6YyVOTvoednTK16VLOEkVfjYGjbGjYEgknbwzYcqlk0dBWSW1eJoGE8beDQEKvyxUhnwUpAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756952; c=relaxed/simple;
	bh=uFjHW0uuCcHS42xIDqX0Hnl/+6HvXqfk6hdZCVZM7a0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m5Pftc1jnnV2Efj6eZ3eiktDbuxLlkxYaGDmrJ/w49oFBP5GAFm3jOsb64lH0B/+LqA9eBcR8h9ap80uG1mWSAdbsi0VxjzUY2SChkU8J5Jm6nEqHkR2rkMcz6/VKyPRPIKH7L+cX9WIfeWO3OKnHkPLJqokIxyDOLLyn0JIPjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N07OTT7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N07OTT7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7941F00A3A;
	Mon,  7 Sep 2026 04:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788756950;
	bh=ewZvPVmx4Wyk5aKaRBwV5gKabFvba2uIYMYoI951phQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N07OTT7agSEnIih101jXUF6iBmPcYv0Q/cQ8iHLEljXZTU951Z/57YeI8HOYBd/E3
	 W9HYTifaOSQYfm7QbU+L0ADs0cs/Q/IHiCAMQ1PJMenO9mfLGKSso7GYkJQA59QOyj
	 mT5JJkiiOMpFhi6YdWMZ8Ka/tlDipJf3vWhl3XQlJDy+v6iKPVqvR2pHDak9hy74g3
	 xugmnNqoEmXstCFiWAc4ZUADX7Wv6ANbEstrqUjJ7q6r7c5qNdf+PT8xg/R4wxbNeV
	 IuBM2e4myFhqpQvgo7m5pjCsOazNyduo8NUc7mwP/Q1GuvJA2Yh5BEFrh/NSw70GUS
	 XlyEMlcGumH8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: codecs: fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045331.16932-2-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
 <20260907045331.16932-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:55:49 +0000
Message-Id: <20260907045550.4C7941F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045331.1693=
2-1-hemanth.selam@gmail.com?part=3D1

