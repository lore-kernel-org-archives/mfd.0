Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2169476CDD
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393690; cv=none; b=O0le7Rc/OzMrkbeEQYvWSbN3ebiEHchCxGiDKnLQv5BrLJj171/EqAnuwCpL420YuWnX39fXbC2Wx/DeJx1Vi1azvEipqnf0vcJ2TYubfBh2GRfnaz5buzCohL/HMjxedKSoGqyVD8hImYI7c9qIUDG4IATa2VY9FsFlLfiDIho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393690; c=relaxed/simple;
	bh=EG/ztHWKElovDpphTXoJLfpgeTlLLOAmLLnmFprYhHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DErW2EhgvQXl5vv3wzQMrCAj5dG21KKjTvUmnk2EghxoGEAiis0dwTlXrFbegurEF/nWxD0vaE/77VJjQZL3mWKl2/ScnxuQ/UtGfSxQbMKxn9TgEDdoQe9yd+52ZtlU1k+7RipniNPfCyi8FiYcKtflbJ3giscaSOxRhBvKW+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=22Xnqm2d; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="22Xnqm2d"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca94bso10169345e9.3
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789393687; x=1789998487; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l49MHyks2tmo+INGHY8t8az6CtTGwBm7JjOMFzvt9u0=;
        b=22Xnqm2dbr36DUq3dpMeMnEmvVI/DkTI4J/ZW8GQPdHh7VfLzwg2o0UFHLCCPtptSk
         epN7PSKWc7anMWkfaQAOkk42e/EoF8S6mpJdCId+TcDuuIPxf4irUyzrcRvxPHyyb0VH
         rUzboPY8EmewmH7nGMV98uVFw2gBWDf7/skuEkxwPmTyUeKTdSZKjde6Gdo3c6LG88p/
         z98gEv9TfxQN3FFi+wmXkQuRh7hFATxuvfI8j54GR4PmWMxFh0aMr7vnsmh547XYeyqn
         /t3eGJpowPBwK74v5LvAzTWQHjNdRDrfLM4p0U9Yp3v+bAEwU45LDEz8RtDPGMrH/cE7
         ae+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393687; x=1789998487;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l49MHyks2tmo+INGHY8t8az6CtTGwBm7JjOMFzvt9u0=;
        b=ZY27+Yc39fSEvB09e1G/CKNX8+VF8HgLJvIjqm9NMEYQhBJzXkQEpfG2eTDexBRMrv
         k376q51GKgEECWaJjUUwu6Z8zPiDcomqr+21AT87tsDRieYRWzlrl7v3FBYUEy+DzQc9
         1nsdp0yG+k3//dT7+0Trep1nVGEngHNRgl29W9WQOwVc90/AAeRZWbyECCPCLt4VYeQ1
         rXy55GKBZCDa8gqOPNrKC/+aJW9Qp3fjnpTgSS3DyfYj9U+yv1mNwf40AFE5Ar6GeZeZ
         61KShXEf1lQ2gMESoFZMbDfaueIXfKx12SIikMB/S3waVUqfL40omyUzFghyshMo82gf
         EuNg==
X-Gm-Message-State: AFuF++klUC0MTglZzgiI4+nm1Vlj+jfBcAkM6Qis0D6N9rw8ZIWfKXHm
	LJ0WrB+rP3SDuX5krh7SQyp6/q8rY5emRF0GmdImimAVhpdgArBbpLVvSv5x1CTov1Q=
X-Gm-Gg: AYBFou1FgSjzRx9HerXW1Vu4v3sJTCR61DyUT9PkMKErDyCI9eMSIWSIhaQJ1+u60jd
	OgNN9yZDeh76V8g5FkLX4s+ZcNFjOGegP6k8QI3SQEW4EOlqlQvEu2fOa2rU4AItkQ4eBtqbCDH
	CH7ZhyeHYFQygq36ZuIB6fM5gY4+fUL2JK3O8lB57zfvp4zJZ3U/Yr/kC+iQYBefUoBWnA/Q+JB
	7v97qlguIiuauPaTEZyWxJ1r3INwyRkaZ5GKPGxjVPLtCYf8lK9jItEAefUBwfykB4nUQeG13jB
	gObloUqnocM+yjGs4p7df2Zd5+7Z0wr39RcVD0TIYw7jeFt4Zda4t9qCTvsi4BtKlBG3FuHg7nL
	VbINZttWktKjAENegUOzPb67FrllB14I3xPsBjcv3A6ma38x6RvtUVQSxGgWpK/rQNsg/Us9ZlR
	Uo01H6c3/aEV4DUWsKFHQCTUx2r4yGkHxMUD4UfCOHkmQSA7XINzgrrEpwG8yItJp3s8UXsc5na
	TqgzP8CbRdvjiRprdk=
X-Received: by 2002:a05:600c:860b:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49e7a648955mr28649655e9.8.1789393686773;
        Mon, 14 Sep 2026 06:48:06 -0700 (PDT)
Received: from alchark-surface.localdomain ([146.70.184.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm447432445e9.7.2026.09.14.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 17:48:03 +0400
Subject: [PATCH] dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3aRCI1NzSwtdM3NzM4tEEwNTQ/NUJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAB2KtM5rAAAA
X-Change-ID: 20260914-bq25798-67768a40517e
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465; i=alchark@flipper.net;
 h=from:subject:message-id; bh=EG/ztHWKElovDpphTXoJLfpgeTlLLOAmLLnmFprYhHs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQt/y1efX5jXeJ50af31mwO1F2wu3v395vXm3exXVytE
 VAUkdYW3jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBU72VhZDjRca99d5eQbfHS6jhWth+vD+QWXP7CwFQi+1S5fB3fmwkM/4xa9zx
 i4H6+LnD/5jNCcgEp+yWqH8txaZ/umtv3/JuEBT8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI has unpublished the BQ25792 charger variant and pulled its docs from
their website.

BQ25798 is a pin and register compatible replacement, which also adds MPPT
tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
BQ25798 - all of them reserved on BQ25792).

Expand the existing binding to include BQ25798 with a fallback compatible
to BQ25792.

Link: https://www.ti.com/product/BQ25798
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index cdce83f05804..43afd232a614 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -11,9 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,bq25703a
-      - ti,bq25792
+    oneOf:
+      - enum:
+          - ti,bq25703a
+          - ti,bq25792
+      - items:
+          - enum:
+              - ti,bq25798
+          - const: ti,bq25792
 
   reg:
     const: 0x6b

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-bq25798-67768a40517e

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

