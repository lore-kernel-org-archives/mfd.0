Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708356;
	b=SIkEJnlDEX0pcRya36VmPIKXZ7c8QYyDGZH8YCEdDbNwwv4MNgFxcZ4DjQRjy3OdPX+B
	 Nnfh4fyDYXSBMGlZdbgJnFYIXZ4hxTQ2Jzt/61lxf/x8Qrr4OtDytdkIW1En10tj26sDU
	 Tpws5gYq+FtEDLFsgApIjXDuuwNPcqlu/kEm/we6Rpyjlufdg1wTyeTEBF2fJPCWw2au2
	 OhX5rqERXG3F2euJtjvLtWwpnZ1nzv5w1YkHb22gLeQRS21vn72qpsk20uZS0cJy7k2AJ
	 Dkt8T/zZgg5qlJGKWcztMkBQUoBQACZnRT5zeieQ8Ue/vBIV1YIINCjTNxgGRGCtORw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
	b=HoQb6a1u+vkx4IeTd9XAbpG4HNzdb2QJvUbkXELvU9lwxOam0lmpjlmQ/YLIWvm1UdMb
	 34AgcimL1G+EOkGSldCzS4k+3zMRvu7EtnvAiN6ZthycU2OVi3N0KFe3ZD8P7HshypG6b
	 Ffqhwmf/NptzKiaTJPpkaiRc9Atp09GqhpUDCiril2eqhQh5WA7thCSR7R0wLOCc94llE
	 EC39znP10UWNuSUy1dtcIKldj7o1DcL3Pbg/HJXlsQ0mJnKVqGaleaBSP7DN0uqKJrLcD
	 AMil3WFsbHj3FCJ3TCdDDfQV8g7FiyzV+6VcQ/Iy6ZAGm15JtNeBiZ4di0hD7Wo+hXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKW+8zlP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC037606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 15:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC037606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKW+8zlP
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386cf1041cdso3610599eec.0
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 07:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708355; cv=none;
        d=google.com; s=arc-20260327;
        b=ICeTyyykdvKB2cN/3+rWhm+CUlSh6ueJ94qru+/evUAUypYZfkzZ8G92b8DUyNsMAC
         Zm+bV7qbt2WCyRxi2v7fSWa//9HkQ4sUL9QSeXovzgF9761M3R5y0PC40eqr/Y4FahVA
         1RvrMvswcl0uxvy8CeduwmdixMvI7TEGNydaYRdBLgv/LH6aEZyQkUWyWi7GgI90rY5I
         B4MhFBqFKndQAT3E/4JttXPTthHr2xIg8orypGgBcxdT/igwtHcIQZeKMCGUCsyHqe4+
         GD6xHYqyqKMYGk8YjzXC0nduOMs8kojodDBQm/5oEgtXkTOpFSa6hBW79Xrzn6wQwGLD
         fE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        fh=Lw2QFAeRDBOe07rUZcBxgwIc9hZMjSrDtDeIoB53eqU=;
        b=H7hLUrIY2JVuvvUMDzEaTZtNOB3TsAOi1riGamLAZeepw7FeXyeoz0z8z85hJY7QSd
         h/hhg3TrMvulWNgGAKgf9KtD2K/6tYrhNf1UnStjjmTsB1ILL39gVbQQc8o7inqfNp8A
         B/y88wvhje0ju2jjKItEaH99+DvmSeHgJ0PY45Q0s08kKFpNDuIl0HFFLX7obXIWLVg/
         8UupVHHjRfKI39ny4zPS8O1/2rYbUfNZu69ZP6GeSeGRJl1amqgK0DmahZq5dfPB69TC
         QeGXO8+6RxonytBfTV6hPm5dCZhIq5jT/X1DxS4yPzGOGBtEUC0F01TE5X6qwFU7+1bU
         qBNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708355; x=1796313155; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        b=fKW+8zlPf99+HyjcdocjVz6thkav0YYBg9Skuvt7r0ErL7oruYPVrIPTHvvrMR1CnS
         pIFI4lXn5rQbCttctHForuoIF/UzPruWvGWhXupHppMDPOtkuI4JT/JuAQf2BZZ54ZFp
         xMqrXuryRVn74JZLTxLGooBWw8eigUfFgPpjL1woGn10gBtqRUH662u/GYlJQjSaun3O
         wJOBJBbYJcweoTW9YBKJOv9nWIj8ntt8T/8rKcGTxv2DcI6pCNSX9Q741h+Gvd6PwBEk
         iPpFQdjoRToEtsG2CZ+dnWQV41ot4sjat+mxGBQjDPh5sqVay/eRABbjz0sJJuqYQ6VA
         hHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708355; x=1796313155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        b=JS6lcbW9kngdBpRFsj1j/DoffIRJpVsnWRAQHxw241pxJhlBeDf8q80cOQtR+SeAut
         zQSGAz9f2Q6zcfpJEfXSErWvTBwaehiKM3oc691Te2/LXQrDBxA9ALEx+hBLd2WYW2ft
         5BpMkBuTkFR1WocZlMXK/ed5tl+smnJnZa0nZxvvoepVXGz+TkhUFNuMlBqfHk8XBf9W
         wlx5S1+KY+pVQq+whwj3SXH7HopqzX52cSQMfWrX/7ECEZR8rO8DJkfs+77QvkiGaFgR
         Rkt87D1QL6MkDjYwzVDXf7r3zJwr9UBBHdCGTvpkfPnRHlIPSqp89pN6B23K+u7yVau7
         PJxg==
X-Forwarded-Encrypted: i=1; AL+hErGeaSLXVvVzqbb9+0fV6h5OLSHgNQr/5zieKHwokqF+PBc3bE7QCXzqGBfT431d6TJ1GXY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ru/reCKGeqqoW55KFlF8xgZfN3GiarF8edUlMwb2TiSuikKJF
	Xyzbn8TzQ4+8FvYGc4esVELAa4/56aSbjbiXYLkLSrjWckD+U28Nqy8+JoVWgjYFl5LFLVC37YA
	olfZ0TcebZ29pG98+zr7hge0aN6/HuPo=
X-Gm-Gg: AZFdTZdoKN022SfLI5NtB73KsZpcsKD3JAkMGmvc1B/QYn7J/vSZhhrJvTrTBPOloWz
	N9yJWcDCNpxhnvNUZ9YRrrnUIbANkmJaFA27OCmli7cPk6BjyFznr1u+UKwmh8sZ6jTiE44oeMl
	5XFxCA3ihb/Ner+CvGUHflIpfKg9MwKTlSU5R25azxI7z7PzhrpDirfGdBTwRqv4soOpVnMVBal
	E6v96+IKO/ONPUmeRmkQ/U0scWE2MjJ4999I8WcNxWRmnfR8rag7emNQXIkjw2o/eMHZBaumLsd
	7cgOkunqkRjsyRI3Z5JYblnLU58VliZ+feMIRX2PiUjobMgVnPI/UGYjxa408fAn56CHFVjJJ2k
	iKJn4V5Bd59d4robfYRSkC0YeVPPmCCFG70Fzbu59FPoz+DkTeoVx1ibVUB1/iQJ1yf40wi2cVO
	R2PEwSQA5srKy8ZLzmIu4AoSjK1mGo0oc=
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id
 5a478bee46e88-386a3fe48d9mr16927412eec.4.1795708354752; Thu, 26 Nov 2026
 07:52:34 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123150224.199601-1-clamor95@gmail.com> <20261123150224.199601-2-clamor95@gmail.com>
In-Reply-To: <20261123150224.199601-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 17:52:22 +0200
X-Gm-Features: Aa3M54rc_YffzEFCwnfkuVALbinO-hBCm-HlGDzQA_xhS0kZ8JcE1X-SBdlekrc
Message-ID: <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:0=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/max8907.txt |  69 -----
>  .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
>  2 files changed, 283 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max=
8907.yaml
>

Hello Mark!

This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
strict to what he picks maybe you can pick this, LED and ADC[1] device
tree patches?

[1] https://lore.kernel.org/lkml/20261123150725.212836-2-clamor95@gmail.com=
/
