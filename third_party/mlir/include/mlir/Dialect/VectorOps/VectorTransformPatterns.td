//===- VectorTransformPatterns.td - Vector-Vector patterns -*- tablegen -*-===//
//
// Copyright 2019 The MLIR Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// =============================================================================
//
// This is the pattern definition file for declarative Vector transformations.
//
//===----------------------------------------------------------------------===//

#ifndef VECTOR_TRANSFORM_PATTERNS
#define VECTOR_TRANSFORM_PATTERNS

include "mlir/IR/OpBase.td"

class HasShape<list<int> shape> :
  CPred<"$0->getType().cast<ShapedType>().hasStaticShape({" #
    StrJoinInt<shape>.result # "})">;

class UnrollVectorOp<list<int> factors> : NativeCodeCall<
  "unrollSingleResultOpMatchingType($_builder, $0->getDefiningOp(), " #
    "{" # StrJoinInt<factors>.result # "})">;

#endif // VECTOR_TRANSFORM_PATTERNS
