Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421998;
	b=LlsEa/4BklN3B2cevV+or6Nc4zVbBZTbU5ly0ZW9jYRDbap5sAXO1FSOHH103Zs8lnWF
	 FNQH4YuLTjipAObh+R+ON78IRmvE9rfpVfGvVw1kGjVcah2QXzZmYJ+KJXSW3taDUakgg
	 bexLaxSYqoWX4x+Uzlm/OMUHhpSN8D0HUh/krgZR1F4CS5ouMCNzCJ/92DpHazVLFiUhM
	 76eQ5gUo62MG1XUG8gIbjZUT+Z5NCAQB2QYDwdMQp6bdmtxP4kAajqwHgZaOXM2Blotch
	 S5VKNMIT3tcICQf0D/uFYnrKwE+5SobaxYSJuK1UDZ0+/t8Ghak+6o8X15riO+c3YXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
	b=VbvlSfPiPYfnY3HxUIm/SIk8isMZM++wZtOBsVd6zLmh64IqV3/jxLXNsYh9Mxeb94Vu
	 n5B4bHQBbOl5pqhcrEY+jHYfag/whTWqAmFrGgiRKQzvBa+cKB0T4HpR2HNUnqDbJP1Hv
	 +hPWO+Gybs39SkUaVx3c7V2RJnurrWh9jv3sZk31MFTXl3cXTUcaHnOZd+6xtVtNVLDJ+
	 DcrbssPU3Vh70NZ8NNASq+FCHGpE2OX/fmSlQACILSIFHIBYCX1KXB0CW+wQ5djB/AP0N
	 g1OlFXqrgJjOMU+1fUBYmDaXkUuwAd6hB5VmeclZ8rJK8sPD+H3GuDeOSZAnHvc3pgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hD0iSrRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F76078870
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79F76078870
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hD0iSrRT
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso131839eec.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421997; cv=none;
        d=google.com; s=arc-20260327;
        b=cQXj+i2FzRhOmV3yqgyzdiWyuO5PXTJiucAifXrXE1KOx2pPRBpezKEU9fmtM6rt/O
         MrR1tYj0V5VG8pDa6wsMJulyjK6MedNeNdJAD7tZMXEMkIoHfJX4R6XVi28O8eKyIfNI
         rqcaTw0gnLZRsmWW0SySSprgs/fmTpIZNx1AeuoRxFdV+t5x8h5f+F6s3TIvDB238Ldq
         oyZjjgXe5gzLoey2/RTo52XZtDHiR6CdzUC4WAUblJZitLdKSmh3g3eNX8XdMtFaCCHR
         5crQWu41q1NLyB0dWtDjjID/A4Ruc9qnlZ9Y3XHqYC954tRXccxbTnl7BR3f4OnkLKLp
         5Luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        fh=ofOs61CUoELBVAPXusOjv16BL8Z42OvDWhzqiepm3eQ=;
        b=GtPl/pqN5C0IHyqEmdDigNQfK8U49tYgQ4EUm2LFlLOhT1eAcMRdwc+gyvCVBNbs7B
         0MatLzDwLCbX8mhkKfeT6Azt16Ee7GMd4KUdxXBg4QuyTy98a4J7Ukp/Synn8ifV2cFh
         A04KTmr+6KLR8nXBxN71JH4Qnl9J/+6DqBE+wDuStYUU2Yco8qAohow0bS6aLx/Gi+FR
         rQxHjS7OKPng/MMVvGLOHcZxWyy393IwNLiDZMKbb00oS13nX7DrWBB4Au9Y/AQc0ziq
         +Vef9V7CzyrntDwch1cVXpL+vJVHFCsgQqbaET4fLJrEHNMf1dGCn0OXInOOHdfZY96Y
         f1Tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421997; x=1793026797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=hD0iSrRTV2rFDvVcKOIFUwNUD8iKSUpwQuM6FvHtXqeTUHDY3EwpOcAMxB3EGrWC5e
         aMQui5WnNLNxgsFN2UdTYhkR+0gN/oZ9kMzVuYFaMzYgqMms3gjZfYlvLd6nAmGkKGi2
         dmhB3CTV0opuUrwmtFCZ3VpOzsESy+/bCKQNuWv3yqTHx+toIeDgpUL6vjpDAqcwzU+0
         h2DKqgnoiELupHSbDLhH0lFhC00JtGWPN6XvJR8eD5DRVKOnDB/thRjO6W/w5ZR9VzhY
         Qo4I6t/Af3OvRrabx0z/VixSYhnpexN5OxuuuDIqQ+4MaMxMDf7yZ4obPX8pscCqC0O3
         GRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421997; x=1793026797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=OmbwQKGKwveNmkRiM7d8KrCPesXlF9wG/NlS6zaQqRew+3utQbbG8PY6vzRc085xFW
         34/tNZvtyaKB1ybhDpPmqB0LFo+PJpIAWZcJCXz3JFgfxezeWrZRBujAAFEZ2vgQm/45
         AcQNwINe1nqi2tNdrZpOHWX1tBBXrvZZeg5V2xY8BmyLVo2eHOjwhLxHCtJnU2AUqeYz
         leFZBpCg+MM3AjUkfOT+/CzRo40sZZBtq7O4pFGwacBIqdDPoBOJH5cqlHExZz/IeQzt
         zkWpBqoOLd3pqeJS7HeXPbERaSoXzQNbE8HHpkOd4dj+AiA/nhnwmqgUnIe6pRnGo92w
         BJ8A==
X-Forwarded-Encrypted: i=1; AKwUvBxgd4eSGS45g0Bwsqq2SElRlC+ftnG5Z89p7LmdenTu6ASTzOn8OxeGKK8jLIbrMJVGUCo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKO0O3Ko723yPGm+wEzgU91V4nddyWCFsk1/0EXyThHLisUl0YZ
	e+WehBXr+GErSuU8/OSSd3sfs8IKQ1Es8su9m8uajZK99Gy0BWmB3rWC+JUMthVL1tQy/d1bVjb
	NyH+3xhZuWwbwjjKA6nTF90PUEUE13jU=
X-Gm-Gg: AYBFou2TPrvVKaXKAII3lANVxCCmrfXAA3sILstl623bHDTgHgtsnd1jWXCHfuBEdWX
	7S1AIGjwALBrKNix/O6LzW2YJ52kSQwJO4pXsl5FuMqwckBTIzbeJczWSFvZvxvwVM6lOqG1sg1
	oppg0Djcz8bvknWbAK0e8k928lOCuWuJ7MBA+kp3tI6d6fjP7CaRqOkOdtvIEShVlhyJpVV87L7
	50gVIVgXYjhDkqI1QCXWy+06gx5393J6JS31pNIJk9bkjaDUrrchjoEz3QmexskGSXwpqFemI8f
	LXEGuI9xq1QTfrOloQAOWpA0W/6Aca2nqIPntBVBpC4lAcl69IH2YWVbLDdQIruSW3ZUB0z6Ab7
	J2KS6nkkP+DfCuXR43kbLR+w=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id
 5a478bee46e88-361a18634bcmr13588245eec.17.1792421996823; Mon, 19 Oct 2026
 07:59:56 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org>
In-Reply-To: <179198322819.839288.5272985130898382430@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:59:42 +0300
X-Gm-Features: AclHuK_ZuMv647lBIwF248HcvuKvZ7xEYTSnrsbVhEmmD8JSr7pPARagQdu9MDM
Message-ID: <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
>
> [...]
>
> --
> Lee Jones
