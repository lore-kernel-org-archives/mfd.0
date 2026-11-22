Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386469;
	b=Rp9U9rQqc9mB7kxXsgAhhZxqndAsXvCM3RM+H4yE5a08y4k6rqfplUlUDF+6L2tZl61+
	 GUW5RivMidQgg/2LRXg2qUwJZyxWo+c0FCMT9CF38aCSfLtTwNVu6jq+wimuObKpwKI4d
	 dfvXsJ9Af2YN9ehg5Tlg/7qCNOnsquIGrrHyJuQ76ac3e3Dk5gwm8DpOhizfzH1Tpwkn+
	 JxWi6pcvls3N0icbjfMM5tP9YHMUXvPvSZOV4nxLUupKsQTXh6+hbw1kZMWl5c2lIwavL
	 1XP5XyxIwaaSncp0UmBItHsH27DP9Iz+zZyx4glO4rjZwUjPD9Y4MORiCdnRoVzma2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386469;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	b=CWjbIPVlHd0+B1izPPJrk9YYLI5dF3TRb7/+J3lCITrWd+MyW0KzfPb7PFwXMKBGoKmT
	 D3iN5vS4PaP3wji5IFwt+HPGilwOX1Ay3xSGq/lJCOxbw0Oddk/hsGDD2FFaF54mtq1B9
	 JfAHofXaaHGTFsrNmP8aEk1BabnCp7Q7nOiM3KjPxI5Ug6mZcCBXzZ+J7Uoe954Ygq/H0
	 Vo/T3ppTCmIbfbvzGnxYOpX2tKCFPTIEA9ieIgtG93cpEekJXNIrGpdyQHWz5VGCOucRH
	 MB6PmHtMdTn8IbxKnpp225qTdKkEXIi1jSDnSNr76vSMrF7Qm6BWSTAxOsVnNM4oGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B0606A31A
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0581F000D1
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386469;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OPvl8hLvtrJ9LTOBEzIfEHa7NVs6FlgdJ+UxySXJn2+owzPa+Vt+9mCch0yAryTlK
	 LiKkgt60uDzMuqGl1g+KQ2E7Kef2Z95xFZhXCWSyepJwA5mw5jkHgWBgaL+/ouNCPi
	 5Me0XAMpJtZOkyXWRKDg50hVESo6gA3s14fPpvaML3vODe8cqYANeTW9By5ZqlvQbZ
	 DW+O4gYiXt5DMKWYBwjgNlyOQxL5nEdqGbETlusikGuwdWedfspjl0dhUgXu2GpTS3
	 xA9Te218tcwx8GuRMHtb97FMKihXyRGlEDeWaIPIFF6LvLCr1FLoOJjV/zkYoce/4u
	 RKUCUZuB26tZg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso2548431e87.0
        for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 14:27:49 -0800 (PST)
X-Gm-Message-State: APuU4Z9BJpUwEjRpBXzhetQ41caS6S2QeSz3hA3pqx5z5n95oS0kMw14
	z+pVEezKUYD6Jfj/kxiBCFrzIEoyLSbPUWctXDiyF4Ym3t13wytyN+zpMUyE49VN5R+cnw946It
	DpqCwrBKPiHe0YMKnzlU8YWe8oJzSjZY=
X-Received: by 2002:a05:6512:3da4:b0:5c1:a828:499d with SMTP id
 2adb3069b0e04-5c1bc8a0f66mr2723779e87.45.1795386467998; Sun, 22 Nov 2026
 14:27:47 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
 <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org> <sashiko-outbox-228331@kernel.org>
In-Reply-To: <sashiko-outbox-228331@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 23:27:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
X-Gm-Features: Aa3M54ok4call33uc2w-wg1Lc8Py5tmJgq7aasSbEWB6j45V_SSTm-IdEboSNII
Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: bcm6846-pmc: child nodes split PMB by Linux
>   subsystem

Parroting, Sashiko. This has been addressed in earlier iterations.

Yours,
Linus Walleij
